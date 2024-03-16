import SwiftUI


struct ContentView: View {
    @State var tasks : [String:String] = [:]
    @State var ispop: Bool = false
    @State var task : String = ""
    @State var desc: String = ""
    var body: some View {
        ZStack(alignment: .top){
            NavigationView {
                List{
                    Section(
                    header: Text("Tasks")){
                        ForEach(Array(tasks.keys), id: \.self) { key in
                            Text(key)
                        }
                        .onDelete(perform: delete)
                    }
                }
                .navigationTitle("TO->DO List")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        addButton
                )
            }
            if ispop{
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                       .frame(
                           width: UIScreen.main.bounds.width * 0.95,
                           height: UIScreen.main.bounds.height * 0.40,
                           alignment: .top
                       )
                       .foregroundColor(.gray)
                    VStack {
                        HStack(alignment: .top) {
                            Text("")
                            Spacer()
                            Button(action: {
                                ispop.toggle()
                            }) {
                                Image(systemName: "x.circle")
                                    .foregroundColor(.red)
                                    .font(.title)
                                    .padding(.all)
                            }
                        }
                        Spacer()
                        TextField("Title...", text: $task)
                            .padding(20)
                            .padding(.leading)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.all)
                                    .frame(
                                        width: UIScreen.main.bounds.width * 0.95,
                                        height: 100 // Increase the height to make it larger
                                            
                                    )
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            )
                            .font(.title)
                        Spacer()
                        TextEditor(text: $desc)
                            .padding(.all)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .padding(.all)
                                    .frame(
                                        width: UIScreen.main.bounds.width * 0.96,
                                        height: 150 // Increase the height to make it larger
                                            
                                    )
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            )
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            ispop.toggle()
                            if !ispop{
                                tasks[task]=desc
                                task = "";desc=""
                            }
                        }) {
                            Text("save")
                                .font(.title)
                                .foregroundColor(.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width:120,height: 50)
                                )
                                .padding(5)
                                .padding(.bottom)
                            
                        }
                    }
                }
                .padding(UIScreen.main.bounds.height * 0.50)
                .padding(.top)

            }
        }
    }
    
    
    var addButton:some View{
        Button("Add"){
            ispop.toggle()
        }
//        .sheet(isPresented: $ispop) {
//            Text("Hello")
//        }
    }
    
    
    func delete(indexSet: IndexSet) {
        // Get the keys to be removed
        let keysToRemove = indexSet.map { index in
            tasks.keys.sorted()[index]
        }
        
        // Remove the key-value pairs from the dictionary
        for key in keysToRemove {
            tasks.removeValue(forKey: key)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class Node inherits A2I{
    i: Object;
    below: Node;

    init(text: Object, next: Node): Node{
        {
            i <- text;
            below <- next; 
            self;
        }
    };

    getbelow(): Node{
        below
    };

    getword(): String{
      {
      let word :String <-
        case i of 
                    intt: Int => i2a(intt);
                    s: String => (s);
                    o: Object => {abort(); "";};
        esac in word;

      }
    };

   
};




class Stack inherits A2I {
    top: Node;
    tam: Int <- 0;

        push(i: Object): Stack{
        
            let node: Node <- (new Node).init(i,top)
            in {
                tam <- tam + 1;
                top <- node; 
                self;
        
            }
        };

        gettop(): Node{
            top
        };

        getsize(): Int{
            tam
        };

        pop(): Stack{
            {
            tam <- tam - 1;
            top <- top.getbelow()   ;
            self;
            }
        };

        

        
       tostring(): String {

          let iterat:Node <- top, strin:String <- "" in
            {
                while(not (isvoid iterat)) loop
                {
                    strin <- strin.concat(iterat.getword());
                    iterat <- iterat.getbelow();

               -- (new IO).out_string(strin.concat("\n"));
                }
                pool;
               strin;
            }
       };
      
};



class Main inherits IO {
    main(): Object {
        let s:Stack <- (new Stack), 
            p:Stack <- (new Stack) in

        {
            s.push("A");
            s.push("B");
            s.push("C");

        out_string(s.tostring().concat("\n")); 

            while(not (s.getsize() = 0)) loop
            {
                out_string(s.tostring().concat("\n"));
                s.pop();

            }
            pool;
            s;
            
        }

    };

};
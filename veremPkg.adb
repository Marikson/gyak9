with Ada.Unchecked_Deallocation;
with Ada.Text_IO;

package body veremPkg is

        procedure Push(S: in out Stack; E: in Element) is
                N: Access_Node;
            begin
                N := new Node;
                N.Value := E;
                N.Next := S.Head;     
                S.Head := N;

                S.Size := S.Size + 1;
        end Push;

        procedure Free is new Ada.Unchecked_Deallocation(Node, Access_Node);

        procedure Drop(S: in out Stack) is
                N: Access_Node;
            begin
                if S.Head = Null then 
                    raise EmptyStack;
                end if;

                N := S.Head;
                S.Head := S.Head.Next;
                Free(N); 
                
                S.Size := S.Size - 1;               
        end Drop;

        procedure Finalize(S: in out Stack) is
            begin
            loop
                Drop(S);
            end loop;

            exception
            when EmptyStack => null;
            --Ada.Text_IO.Put("Lefutott a finalize");
        end Finalize;

        procedure Pop(S: in out Stack; E: out Element) is
            begin
                E := S.Head.Value;
                Drop(S);               
        end Pop;

        function Top(S: Stack) return Element is
            begin 
                return S.Head.Value;
        end Top;

        function IsEmpty(S: Stack) return Boolean is
            begin 
                return S.Size = 0;
        end IsEmpty;

        function Size (S: Stack) return Natural is 
            begin 
                return S.Size;
        end Size;

end veremPkg;
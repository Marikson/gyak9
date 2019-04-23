With Ada.Finalization;
Use Ada.Finalization;

Generic
        type Element is private;
        --Meret: in Positive;

package veremPkg is

        EmptyStack : Exception;

         type Stack is new Limited_Controlled with private;

         procedure Finalize(S: in out Stack);

         procedure Push(S: in out Stack; E: in Element);
         procedure Pop(S: in out Stack; E: out Element);
         function Top(S: Stack) return Element;
         function IsEmpty(S: Stack) return Boolean;
         function Size (S: Stack) return Natural;

         --procedure Drop(S: in out Stack);

    private

        type Node;
        type Access_Node is access all Node;
        --type Arr is array (1..Meret) of Element;

        type Node is record
            Value: Element;
            Next: Access_Node;
        end record;

        type Stack is new Limited_Controlled with record
            Size: Natural := 0;
            Head: Access_Node := Null;
        end record;

        
        

end veremPkg;
Generic
    type Element is private;

package listaPkg is
    type Lista is private;
    EmptyList: constant Lista;

    NoValue: exception;
    
    function IsEmpty(L: Lista) return Boolean;
    function Add(L: Lista; E: Element) return Lista;
    function Read(L: Lista) return Element;
private

    type Node;
    type Lista is access constant Node; 
    EmptyList: constant Lista := null;

    type Node is record
        Value: Element;
        Next: Lista := EmptyList;
    end record;

end listaPkg;
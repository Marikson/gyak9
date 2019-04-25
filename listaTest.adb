with Ada.Text_IO;
use Ada.Text_IO;
With listaPkg;

procedure listaTest is
    package IntegerListaPkg is new listaPkg (
        Element => Integer
        );
    use IntegerListaPkg;    

    procedure assert(felt: Boolean; uzenet: String) is

    begin
        if felt then 
            Put_Line ("PASSED: " & uzenet);
        else 
            Put_Line ("FAIL: " & uzenet);
        end if;
        New_Line;
    end assert;

procedure Test_IsEmpty_On_New_List is 
    L: Lista;
begin
    assert(IsEmpty(L), "Az uj lista ures.");
end Test_IsEmpty_On_New_List;

procedure Test_Add is 
    L: Lista;
begin
    Add(L, 5);
    assert(not IsEmpty(L), "Az uj lista nem ures.");
end Test_Add;

procedure Test_Read is 
    L: Lista;
begin 
    Add(L, 5);
    assert(Read(L) = 5, "A visszaadott ertek helyes.");
end Test_Read;

procedure Test_Read_Empty_List is 
    B: Boolean;
    E: Integer;
    L: Lista;
begin 
    B := false;
    begin
        E := Read(L);
    exception
        when NoValue => B := True;
        when others => null;
    end;
    assert(B, "Ures lista olvasasa NoValue kivetelt dob");
end Test_Read_Empty_List;

procedure Test_Read_Last is 
    L: Lista;
begin 
    Add(L, 1);
    Add(L, 2);
    Add(L, 3);
    Add(L, 4);
    Add(L, 5);
    assert(Read(L) = 5, "A visszaadott ertek az utolso betett elem.");
end Test_Read_Last;

procedure Test_Remove is 
    L: Lista;
begin 
    Add(L, 1);
    Add(L, 2);
    Remove(L);
    assert(Read(L) = 1, "Az utolso erteket tavolitja el");
end Test_Remove;

procedure Test_Remove_Empty_List is 
    L: Lista;
    B: Boolean;
begin 
    B := False;

    begin
        Remove(L);
    exception
        when NoValue => B := True;
        when others => null;
    end;
        
    assert(B, "Az ures listabol eltavolitas kivetelt dob");
end Test_Remove_Empty_List;

begin

Test_IsEmpty_On_New_List;
Test_Add;
Test_Read;
Test_Read_Empty_List;
Test_Read_Last;
Test_Remove;
Test_Remove_Empty_List;

end listaTest;
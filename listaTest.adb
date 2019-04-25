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

procedure Test_EmptyList_IsEmpty is 
begin 
    assert(IsEmpty(EmptyList), "A konstans EmptyList ures.");
end Test_EmptyList_IsEmpty;

procedure Test_IsEmpty_On_New_List is 
    L: Lista;
begin
    assert(IsEmpty(L), "Az uj lista ures.");
end Test_IsEmpty_On_New_List;

procedure EmptyList_Equals_New_List is 
    L: Lista;
begin 
    assert(EmptyList = L, "Az EmptyList es az uj Lista erteke megegyezik.");
end EmptyList_Equals_New_List;

procedure Test_Add is 
    L: Lista;
begin
    L := Add(EmptyList, 5);
    assert(EmptyList /= L, "EmptyList nem egyenlo L-lel.");
    assert(not IsEmpty(L), "Az uj lista nem ures.");
end Test_Add;

procedure Test_Read is 
    L: Lista;
begin 
    L := Add(EmptyList, 5);
    assert(Read(L) = 5, "A visszaadott ertek helyes.");
end Test_Read;

procedure Test_Read_Empty_List is 
    B: Boolean;
    E: Integer;
begin 
    B := false;
    begin
        E := Read(EmptyList);
    exception
        when NoValue => B := True;
        when others => null;
    end;
    assert(B, "Ures lista olvasasa NoValue kivetelt dob");
end Test_Read_Empty_List;

procedure Test_Read_Last is 
    L: Lista;
begin 
    L := Add(EmptyList, 1);
    L := Add(EmptyList, 2);
    L := Add(EmptyList, 3);
    L := Add(EmptyList, 4);
    L := Add(EmptyList, 5);
    assert(Read(L) = 5, "A visszaadott ertek az utolso betett elem.");
end Test_Read_Last;

begin

Test_IsEmpty_On_New_List;
Test_Add;
Test_Read;
Test_Read_Empty_List;
Test_Read_Last;

end listaTest;
with veremPkg;
with Ada.Text_IO;

procedure Test is

package EgeszVeremPkg is new veremPkg (
    Element => Integer
    --Meret => 5
);

use EgeszVeremPkg;

procedure assert(felt: Boolean; uzenet: String) is 

begin
    Ada.Text_IO.Put(uzenet & ": ");
    if felt then 
        Ada.Text_IO.Put("passed");
    else
        Ada.Text_IO.Put("failed");  
    end if;
    Ada.Text_IO.New_line;
end assert;

procedure Test_NewStack is
    Verem: Stack;

begin
    assert(IsEmpty(Verem), "Uj verem ures");
    assert(Verem.Size = 0, "Veremben levo elemszam: 0");

end Test_NewStack;

procedure Test_Push is 
    Verem: Stack;

begin 
    Push(Verem, 5);
    assert(not IsEmpty(Verem), "Push utan a verem ures");
    assert(Verem.Size = 1, "Veremben levo elemszam: 1");

end Test_Push;

procedure Test_Pop is 
    Verem: Stack;
    Abba: Integer;

begin 
    Push(Verem, 5);
    Pop(Verem, Abba);
    assert(IsEmpty(Verem), "Pusholt majd Popolt verem ures");
    assert(Verem.Size = 0, "Veremben levo elemszam: 0");
end Test_Pop;

procedure Test_Pop_on_empty is 
    Verem: Stack;
    Abba: Integer;
    Helyes: Boolean;
begin 
    Helyes := false;

    begin
        Pop(Verem, Abba);
    exception
        when EmptyStack => Helyes := true;
        when others => null;
    end;

    assert(Helyes, "Ures verembol olvasas hibat dob");
end Test_Pop_on_empty;

procedure Test_Top is 
    Verem: Stack;

begin 
    Push(Verem, 10);
    assert(Top(Verem) = 10, "A legfelso elem: 10");
    assert(Verem.Size = 1, "Veremben levo elemszam: 1");

end Test_Top;

Verem: Stack;
--Ebbe: Integer;

begin 

Test_NewStack;
Test_Pop;
Test_Pop_on_empty;
Test_Push;
Test_Top;




--for i in 1..10 loop
  --  Pop(Verem, Ebbe);
    --Ada.Text_IO.Put("Ezt :" & Integer'Image(Ebbe) & " Bent maradt elemek szama: " & Integer'Image(Verem.Size) );
    --Ada.Text_IO.New_line;
--end loop;


--exception
--when NullPtr => Ada.Text_IO.Put("Nincs hozzaferes a mutatott ertekhez!");

end Test;
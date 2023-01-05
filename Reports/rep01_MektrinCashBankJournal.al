report 50140 "Mektrin Cash/Bank Journal"
{
    Caption = 'Cash/Bank Journal';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/CashBankJournal.rdl';

    dataset
    {
        dataitem(BankAccountLedgerEntry; "Bank Account Ledger Entry")
        {
            DataItemTableView = sorting("Posting Date");
            RequestFilterFields = "Bank Account No.", "Bank Acc. Posting Group";
            column(Posting_Date; "Posting Date")
            {
                IncludeCaption = true;
            }
            column(Document_Type; "Document Type")
            {
                IncludeCaption = true;
            }
            column(Document_No; "Document No.")
            {
                IncludeCaption = true;
            }
            column(Description; Description)
            {
                IncludeCaption = true;
            }
            column(Balance_No; "Bal. Account No.")
            {
                IncludeCaption = true;
            }
            column(Debit_Amount; "Debit Amount")
            {
                IncludeCaption = true;
            }
            column(Credit_Amount; "Credit Amount")
            {
                IncludeCaption = true;
            }
            column(Balance; Balance)
            {

            }
            column(Bank_Account_No; "Bank Account No.")
            {
                IncludeCaption = true;
            }
            column(Bank_Acc_Posting_Group; "Bank Acc. Posting Group")
            {
                IncludeCaption = true;
            }

            dataitem(Contact; Contact)
            {
                RequestFilterFields = "Date Filter";
                DataItemLink = "No." = field("Bank Account No.");
                column(Date_Filter; "Date Filter")
                {
                    IncludeCaption = true;
                }
                column(Period; "Date Filter")
                {
                    IncludeCaption = true;
                }
                column(ALFABANK_EURO; "No.")
                {
                    IncludeCaption = true;
                }
            }

            dataitem(Bank_Account; "Bank Account")
            {
                column(AlfaBank; Name)
                {
                    IncludeCaption = true;
                }
            }

            trigger OnAfterGetRecord();
            var
            begin

                Balance := Balance + "Debit Amount" - "Credit Amount";
            end;
        }
    }

    labels
    {
        MektrinCashBankJournalCap = 'Ditar Arke/Banke';
    }

    var
        Balance: Decimal;
}
let rec insertion k s = 
  match s with
  | [] -> k::[]
  | e::r when k > e -> e::insertion k r
  | e::r -> k::e::r
;;
let s = 2::(3::[]);;
let k = 4;;

insertion k s ;;

print_int k;;
print_string "reussi" ;;


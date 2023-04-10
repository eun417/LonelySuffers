package kr.co.carpool.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Passenger {
	private int matchNo;
	private int matchStatus; //0.매칭중 1.매칭취소 2.매칭완료
	private int carpoolNo;
	private int passengerNo;
	private String passengerName; //JOIN으로 얻는 MEMBER_NAME
	private int passengerGender; //JOIN으로 얻는 MEMBER_GENDER
	private String passengerPhone; //JOIN으로 얻는 MEMBER_PHONE
	private String passengerEmail; //JOIN으로 얻는 MEMBER_EMAIL
	private String passengerMsg; //가지고올때 matchStatus 무조건 hidden 으로 1 매칭중으로 가져오게 함.
	private String requestDate; //(TO_CHAR(SYSDATE,'YYYY-MM-DD/HH24:MI:SS'))
	
	public String getMatchResult() {
		if(matchStatus==0) {
			return "매칭중";
		}else if(matchStatus==1) {
			return "매칭취소";
		}else{
			return "매칭완료";
		}
	}
}

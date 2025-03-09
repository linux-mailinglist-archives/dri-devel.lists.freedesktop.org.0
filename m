Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B09BA5812C
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 07:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223E810E2EC;
	Sun,  9 Mar 2025 06:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 551 seconds by postgrey-1.36 at gabe;
 Sun, 09 Mar 2025 06:46:10 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D46F10E2EC
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 06:46:09 +0000 (UTC)
X-QQ-mid: bizesmtpip4t1741502154t5gjj86
X-QQ-Originating-IP: PIiBMmc3En4vJW7/I3LQGRV2j1PvNOrAV1RB8S3SouM=
Received: from [IPV6:240f:10b:7440:1:893e:bed3 ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 09 Mar 2025 14:35:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2792177622462223588
Message-ID: <3605ABCB7EF60115+2de06a28-1b3d-4a0e-b960-9e0a74c6e19d@radxa.com>
Date: Sun, 9 Mar 2025 15:35:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: rockchip: Enable DisplayPort for rk3588s
 Cool Pi 4B
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-7-andyshrk@163.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250223113036.74252-7-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OSjQccS6YHkHGZO/4XIstSha1bbvM46PGbFraZYkhZZCQt74Dd8ZL/Y/
 1GEPpu56jMpNgGe7E6MZ0mdBmFyT5FIiUNU2szXyC3pcLUW6zhAOtc9ldV406WaTckMwglT
 NGOeD9swKehIfKXXVMHcReBzS4LrsnhsF6W5OFDLufabI1QH2hxxbyqcqpeY60Hg941MCOK
 z2OXcTaTawhjyS5f3fyy2SgiSapDIbA6S5fYSHJOR2/oE8SU2sO4678aY4oCSeAptnscB0a
 0wbbypYeG6xDa+stLA1MA0HnfeqPTdSvP6h5ZJFeRBnwY7FbwJ1drzpf3YFprI5qCAAmfYT
 HBINVSkIg6rMuQosLfIDO8FNyIESyWhkjyh1+unsGt5rzaUPt8qO7qAHcoEcsbW5F+RCyXs
 CEj1qxm3A04TdkxcfRBFwY/YCnKNk8vbmVSyOZC8ywt/zYZdGbQBdClKzAGk04egUKvo9Q1
 UNa0tuL5hMqmC6MSju05AfllJHu5n2gsOX1YHeCFgO7OFnvPonLu9w4JnEIM93l+vOgd6sA
 /4TrWIgkWjUMyTQYKpabACkz3ExqPas8Kw2ZlGc3TNeeVfAuYokbmaG//L98sK4s9CvrwjO
 BncpbacETa+tiiBwPh7cnunrqfzG6tGg0FdgwtUBX7mZOYWOkfuh8Eyh0Dll2XQHLBMljUr
 RXfmDkwqycyxx7M1+Z0n5u/JoXw57TDFwLdlS16Lt69fUTpBcyc/RKAC81/jWVjgiNxEYjW
 Zvq4+yvIZivmHDIkfQ/Y8Lmmrrf1XXWVyM0CWiB5nmrNawiAzyKmzu+EyuaKN+B/Alz/Qfa
 V1420fdPQ8dbwXRvDF85f7Tt3RdnJFv1dn5QwSFnain4roXOM93bMx2GLEUtM+2Ul0VmdG/
 WM0SYWJGkzV1SuJVsEsgZVcloXr2E4iuDjKtmzau9UakO0ZBStXhTF8mYJYpi8JV2dzXZj8
 /hlNLzpaDt0v9P5aNth7/8tkS
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On 2/23/25 20:30, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Enable the Mini DisplayPort on this board.
> Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address error,
> expected "a"" if we use it directly after endpoint, so we use "a"
> instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>   .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> index e892dd7c91aa..0f58eb56557f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts
> @@ -39,6 +39,18 @@ chosen {
>   		stdout-path = "serial2:1500000n8";
>   	};
>   
> +	dp-con {
> +		compatible = "dp-connector";
> +		label = "DP OUT";
> +		type = "mini";
> +
> +		port {
> +			dp_con_in: endpoint {
> +				remote-endpoint = <&dp0_out_con>;
> +			};
> +		};
> +	};
> +
>   	hdmi-con {
>   		compatible = "hdmi-connector";
>   		type = "d";
> @@ -220,6 +232,24 @@ &gpu {
>   	status = "okay";
>   };
>   
> +&dp0 {
> +	status = "okay";
> +	pinctrl-0 = <&dp0m0_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&dp0_in {
> +	dp0_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_dp0>;
> +	};
> +};
> +
> +&dp0_out {
> +	dp0_out_con: endpoint {
> +		remote-endpoint = <&dp_con_in>;
> +	};
> +};
> +

These three nodes should be placed above the &gpu node.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

>   &hdmi0 {
>   	status = "okay";
>   };
> @@ -889,3 +919,10 @@ vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
>   		remote-endpoint = <&hdmi0_in_vp0>;
>   	};
>   };
> +
> +&vp2 {
> +	vp2_out_dp0: endpoint@a {
> +		reg = <ROCKCHIP_VOP2_EP_DP0>;
> +		remote-endpoint = <&dp0_in_vp2>;
> +	};
> +};


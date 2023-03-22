Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D806C5AA9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 00:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC8410E288;
	Wed, 22 Mar 2023 23:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA8410E288
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 23:40:50 +0000 (UTC)
Received: from p508fd58e.dip0.t-ipconnect.de ([80.143.213.142]
 helo=phil.fritz.box) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pf84R-0005ZV-Td; Thu, 23 Mar 2023 00:40:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: (subset) [PATCH v6 01/17] dt-bindings: display: rockchip: convert
 rockchip-lvds.txt to YAML
Date: Thu, 23 Mar 2023 00:40:40 +0100
Message-Id: <167952842636.1588125.15379043637737791314.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 jernej.skrabec@gmail.com, linux-rockchip@lists.infradead.org,
 alim.akhtar@samsung.com, devicetree@vger.kernel.org, jonas@kwiboo.se,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, andrzej.hajda@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Dec 2022 15:22:14 +0100, Johan Jonker wrote:
> Convert rockchip-lvds.txt to YAML.
> 
> Changed:
>   Add power-domains property.
>   Requirements between PX30 and RK3288
> 
> 
> [...]

Applied, thanks!

[09/17] ARM: dts: rockchip: rk3288: fix dsi node
        commit: ea2d16f90629e3158307d0183cad5c40aa55c995
[10/17] ARM: dts: rockchip: rk3288: fix lvds node
        commit: 8a19e4c74d17ed8d1e6bc06b32c5b7b7c3b9fcfb
[11/17] ARM: dts: rockchip: rk3288: fix dp node
        commit: 95e2ac6ae9f2330557a6aef70bf15173e1dd9714
[12/17] arm64: dts: rockchip: px30: fix lvds node
        commit: 0d5e24918976edffffee006e07730434a36d264a
[13/17] arm64: dts: rockchip: px30: fix dsi node
        commit: 30322f812d4e0e75e2488c1d45aba94e51dd19bb
[14/17] arm64: dts: rockchip: rk3399: fix dsi node
        commit: f82fe7ad31530b38d2f61aa6ae68bd35c33f4ad0
[15/17] arm64: dts: rockchip: rk3399: fix dp node
        commit: d94024bd6342c6f3e88c5fac785a685c1974d48e
[16/17] arm64: dts: rockchip: rename vbus-supply to phy-supply in rk3566-box-demo.dts
        commit: fc440ea1732abb714150bb8f3d90672ccc679e2d
[17/17] arm64: dts: rockchip: rk356x: remove hclk from dsi node
        commit: cadda005961cd6a202ae6f8ff99f2bba35a31dc8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

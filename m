Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0188A1E3D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 20:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8DF10F297;
	Thu, 11 Apr 2024 18:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5984B10F1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 18:30:59 +0000 (UTC)
Received: from ip-185-104-138-67.ptr.icomera.net ([185.104.138.67] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ruzCC-0001so-3Y; Thu, 11 Apr 2024 20:30:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, agx@sigxcpu.org,
 neil.armstrong@linaro.org, airlied@gmail.com, daniel@ffwll.ch,
 sam@ravnborg.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, quic_jesszhan@quicinc.com, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh@kernel.org, megi@xff.cz,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: (subset) [PATCH 0/5] Add Support for RK3326 GameForce Chi
Date: Thu, 11 Apr 2024 20:29:54 +0200
Message-Id: <171286007459.1886699.12166776113258136187.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325134959.11807-1-macroalpha82@gmail.com>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Mar 2024 08:49:54 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the GameForce Chi [1].
> 
> The GameForce Chi has the following hardware:
> Tested:
>  - 3.5" dual lane 640x480 DSI display.
>  - 15 GPIO based face buttons.
>  - 2 ADC based face buttons.
>  - 1 ADC joystick (left) connected to internal SARADC.
>  - RGB LED arrays for key backlighting
>  - Dual internal speakers.
>  - Realtek RTL8723BS SDIO WiFi.
>  - Single SDMMC slot.
> 
> [...]

Applied, thanks!

[4/5] dt-bindings: arm: rockchip: Add GameForce Chi
      commit: c1bc09960d05cfbfb94cfdfb66b4733e3ddf1638
[5/5] arm64: dts: rockchip: Add GameForce Chi
      commit: ad59da1ab997e81061ec980300fb7ce2d5e4bc5d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

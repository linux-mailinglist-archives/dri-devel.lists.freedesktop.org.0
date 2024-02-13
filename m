Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC524853AA8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 20:16:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8329A10E454;
	Tue, 13 Feb 2024 19:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5456910E454
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 19:16:39 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rZyGW-0008FY-Mi; Tue, 13 Feb 2024 20:16:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, sam@ravnborg.org, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, kernel@puri.sm,
 quic_jesszhan@quicinc.com, conor+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>, megi@xff.cz,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 neil.armstrong@linaro.org, mripard@kernel.org, agx@sigxcpu.org
Subject: Re: (subset) [PATCH 0/7] Add Support for RK3566 Powkiddy RGB10MAX3
Date: Tue, 13 Feb 2024 20:16:20 +0100
Message-Id: <170785172856.3347621.11895258422824672515.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240212184950.52210-1-macroalpha82@gmail.com>
References: <20240212184950.52210-1-macroalpha82@gmail.com>
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

On Mon, 12 Feb 2024 12:49:43 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RGB10MAX3 handheld gaming console.
> 
> [1] https://powkiddy.com/products/pre-sale-powkiddy-rgb10max3-handheld-game-console
> 
> Chris Morgan (7):
>   dt-bindings: display: st7703: Add Powkiddy RGB10MAX3 panel
>   drm/panel: st7703: Add Powkiddy RGB10MAX3 Panel Support
>   dt-bindings: display: Document ST7703 panel rotation
>   drm/panel: st7703: Add Panel Rotation Support
>   arm64: dts: rockchip: Update powkiddy rk2023 dtsi for RGB10MAX3
>   dt-bindings: arm: rockchip: Add Powkiddy RGB10MAX3
>   arm64: dts: rockchip: Add Powkiddy RGB10MAX3
> 
> [...]

Applied, thanks!

[5/7] arm64: dts: rockchip: Update powkiddy rk2023 dtsi for RGB10MAX3
      commit: 039a03c377d64ec832a8fb1b8f8b5badd404989f
[6/7] dt-bindings: arm: rockchip: Add Powkiddy RGB10MAX3
      commit: fbe7823623a8c02759afdfb521709f4fa216849a
[7/7] arm64: dts: rockchip: Add Powkiddy RGB10MAX3
      commit: 4b325c0d4f539b553a4529f16476f08757779293

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

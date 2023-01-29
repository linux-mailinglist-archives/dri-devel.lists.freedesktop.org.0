Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A246967FF66
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 14:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B1A10E059;
	Sun, 29 Jan 2023 13:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953D210E059
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 13:39:19 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pM7ts-0003rM-FJ; Sun, 29 Jan 2023 14:39:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	Chris Morgan <macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V12 0/4] drm/panel: Add Magnachip D53E6EA8966
 Panel Controller
Date: Sun, 29 Jan 2023 14:39:10 +0100
Message-Id: <167499930027.3595793.11045957919180031569.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123154603.1315112-1-macroalpha82@gmail.com>
References: <20230123154603.1315112-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 krzysztof.kozlowski+dt@linaro.org, linux-rockchip@lists.infradead.org,
 thierry.reding@gmail.com, tzimmermann@suse.de, robh+dt@kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Jan 2023 09:45:59 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add the Magnachip D53E6EA8966 panel IC controller for display panels
> such as the Samsung AMS495QA01 panel as found on the Anbernic RG503.
> This panel uses DSI to receive video signals, but 3-wire SPI to receive
> command signals using DBI.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: add display to RG503
      commit: 97ce9f36631dafd6daaab0c06a6a48b4301199b5

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

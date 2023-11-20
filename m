Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB27F1943
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 18:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC39710E0C4;
	Mon, 20 Nov 2023 17:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E300F10E443
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 17:02:34 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.sntech)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1r57fI-0000jr-Uf; Mon, 20 Nov 2023 18:02:28 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>,
	hjc@rock-chips.com
Subject: Re: (subset) [PATCH v1 0/4] Rockchip rk3066_hdmi update
Date: Mon, 20 Nov 2023 18:02:18 +0100
Message-Id: <170049972584.1779880.13529778706599017239.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
References: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Nov 2023 14:40:13 +0100, Johan Jonker wrote:
> Update the Rockchip rk3066_hdmi driver in a somewhat similar way
> to what is proposed for the inno_hdmi driver.
> 
> Johan Jonker (4):
>   drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
>   drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
>   drm/rockchip: rk3066_hdmi: Remove useless output format
>   drm/rockchip: rk3066_hdmi: Remove unused drm device pointer
> 
> [...]

Applied, thanks!

[1/4] drm/rockchip: rk3066_hdmi: Remove useless mode_fixup
      commit: 1044f4a31734eef000f42cdaaf35bb2f76286be5
[2/4] drm/rockchip: rk3066_hdmi: Switch encoder hooks to atomic
      commit: ae3436a5e7c2ef4f92938133bd99f92fc47ea34e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA16B187F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 02:07:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A35810E76C;
	Thu,  9 Mar 2023 01:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113C510E76C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 01:07:37 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pa4kd-00041d-LT; Thu, 09 Mar 2023 02:07:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH] drm/rockchip: vop2: add polarity flags to RGB output
Date: Thu,  9 Mar 2023 02:07:19 +0100
Message-Id: <167832398246.362678.16304848436685688668.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230302123949.957998-1-gerald.loacker@wolfvision.net>
References: <20230302123949.957998-1-gerald.loacker@wolfvision.net>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Mar 2023 13:39:49 +0100, Gerald Loacker wrote:
> Use h/v-sync and pixel clock polarity flags for RGB output. For all other
> outputs this is already implemented.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: add polarity flags to RGB output
      commit: 66ab57574f2c8233550f641ecdc34fd0ef61341d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

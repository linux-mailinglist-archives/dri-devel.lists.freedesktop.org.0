Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D53946C9
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 20:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04F6E52E;
	Fri, 28 May 2021 18:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B715A6E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 18:09:54 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lmgve-0006Ve-C9; Fri, 28 May 2021 20:09:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Daniel Vetter <daniel@ffwll.ch>, Peter Robinson <pbrobinson@gmail.com>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp-core: add MODULE_FIRMWARE macro
Date: Fri, 28 May 2021 20:09:43 +0200
Message-Id: <162222530163.2887132.13441633389546243024.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506092951.515813-1-pbrobinson@gmail.com>
References: <20210506092951.515813-1-pbrobinson@gmail.com>
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

On Thu, 6 May 2021 10:29:51 +0100, Peter Robinson wrote:
> The CDP DP component of the rockchip GPU driver requires firmware
> so define MODULE_FIRMWARE for rockchip/dptx.bin so the details
> are available in the module info.

Applied, thanks!

[1/1] drm/rockchip: cdn-dp-core: add MODULE_FIRMWARE macro
      commit: c0677e41a47fbb37c4ed7200e5c7f610a2ffbd4b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

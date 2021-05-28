Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30827394754
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 20:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A45E6F621;
	Fri, 28 May 2021 18:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8C46F61F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 18:56:00 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lmheH-0006hU-0y; Fri, 28 May 2021 20:55:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] drm/rockchip: vop_reg: add PX30 version info
Date: Fri, 28 May 2021 20:55:54 +0200
Message-Id: <162222814866.2904787.9246855996238549886.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210131125016.10837-1-jbx6244@gmail.com>
References: <20210131125016.10837-1-jbx6244@gmail.com>
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 31 Jan 2021 13:50:16 +0100, Johan Jonker wrote:
> To reduce memory various Rockchip VOP versions share
> common reg structures. However more recent added SoCs not
> always have to same futures as the old ones.
> Add PX30 missing version info, so all VOP version checks
> work correct if needed in the future.

Applied, thanks!

[1/1] drm/rockchip: vop_reg: add PX30 version info
      commit: 872b68e9750eddd086b93a6004ebe82c64aef670

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

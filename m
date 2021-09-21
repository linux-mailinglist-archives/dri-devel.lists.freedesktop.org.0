Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C241312E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 12:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDF86E92D;
	Tue, 21 Sep 2021 10:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3886E920
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:04:08 +0000 (UTC)
Received: from ip5f5a6e92.dynamic.kabel-deutschland.de ([95.90.110.146]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mScdC-0001rd-5o; Tue, 21 Sep 2021 12:04:06 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>, Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/rockchip: remove unused psr_list{,_lock}
Date: Tue, 21 Sep 2021 12:03:31 +0200
Message-Id: <163221857584.2031971.5320257639835552943.b4-ty@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210915135007.1.I926ef5cef287047c35a17e363c919599c6ee6e4c@changeid>
References: <20210915135007.1.I926ef5cef287047c35a17e363c919599c6ee6e4c@changeid>
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

On Wed, 15 Sep 2021 13:50:11 -0700, Brian Norris wrote:
> Some leftover cleanup from commit 6c836d965bad ("drm/rockchip: Use the
> helpers for PSR").

Applied, thanks!

[1/1] drm/rockchip: remove unused psr_list{,_lock}
      commit: d3e2ec6cd1636ced67c6f57d95d8ad24f964691d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

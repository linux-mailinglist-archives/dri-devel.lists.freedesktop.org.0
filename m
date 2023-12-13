Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C004081160C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 16:22:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAF710E273;
	Wed, 13 Dec 2023 15:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3263A10E273
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 15:22:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2DF2BB81DD3;
 Wed, 13 Dec 2023 15:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33078C433C8;
 Wed, 13 Dec 2023 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702480942;
 bh=YPIdfLutr1vABv3Q6sPpdsVd0b9UvHAsH7E+Whw8DpU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XXmRpi/R8GzJ1yZo0VgYnbonun0E0w8rFgxTztIpsfCpjQc/f28wkbX7bGBLdMJK8
 gKhRMOxkHRTcNfcFVCS5QlOxBwmAp/sxHJw2pJIj6erMSOe63uKZwDqPnUCZwZ96bj
 bIjY3id78dXTZuqZcmxSTurVDSFpukLoFyTSTc0tIBGoHf6v7elC/l+Z+Bj0KPddUn
 cfFfxC1C2Jykmp1t3cWpWNx4mfFmKB2vZmNt0EwStfO8XLfZZM5F6u5m+TKK6vBQev
 0b1WEqFIobWAU3Gv+hC0jO/FhahFTWSIILSd5GFP5cXGRBFTTXoZPsv6e4/dOw78yz
 VTAKb7OnHHUeg==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231213043226.10046-1-rdunlap@infradead.org>
References: <20231213043226.10046-1-rdunlap@infradead.org>
Subject: Re: (subset) [PATCH] drm/drm_modeset_helper_vtables.h: fix
 typos/spellos
Message-Id: <170248094019.191897.72066255229161842.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:22:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023 20:32:26 -0800, Randy Dunlap wrote:
> Fix spelling problems as identified by codespell.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime


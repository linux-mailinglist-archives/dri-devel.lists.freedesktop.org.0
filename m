Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5708AAD26
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 12:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1790510FA5E;
	Fri, 19 Apr 2024 10:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07110FA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 10:58:36 +0000 (UTC)
Received: from [213.70.33.226] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rxlwx-0000Jg-3z; Fri, 19 Apr 2024 12:58:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 14/15] drm/rockchip: inno_hdmi: switch to struct drm_edid
Date: Fri, 19 Apr 2024 12:58:33 +0200
Message-ID: <3126037.BEx9A2HvPv@phil>
In-Reply-To: <1218cb4fd79149c90dc0c82c42ae0c8a36acf055.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
 <1218cb4fd79149c90dc0c82c42ae0c8a36acf055.1713273659.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Dienstag, 16. April 2024, 15:22:28 CEST schrieb Jani Nikula:
> Prefer struct drm_edid based functions over struct edid.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>



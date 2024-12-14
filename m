Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBCB9F2182
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 00:11:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0DED10E093;
	Sat, 14 Dec 2024 23:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="rWx5GosI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5310E093
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 23:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/dcvQTM5YLir1CGChPDq5O3U4OygiIvAkfxT6zYGWE=; b=rWx5GosIifj3o81oaRH7i/IVUj
 OiZVASVPZd75sZTE1/xHrV9mF+dh5vCHP9tREHi/ZUmc9SjNBBfT+I/tcyYFQyVqwVjZnQc3wYJKE
 jW/CJBkFJHJJkvlhMpW18nGLUmIoeN3GYJ550w6tpfeQ/4UeeGogJz/u97T45cz7f6JTYYGT31PvQ
 qDF+C1fdBIQoWf06XVzuz8+W1eLyMkal/2U0wewFxyczhJWr2fLjom8b4FoatPoQiWBvbpUpk6Od2
 9En2e55rpk6E7nAu2b723DiW1jeZmEnFSnFzEasAmKsMWzSHV9tGl/m8gK0lFeRAzLjLJeW64tz4u
 vffYUgdQ==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tMbHy-0000hg-CX; Sun, 15 Dec 2024 00:11:10 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>, sebastian.reichel@collabora.com,
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] drm/rockchip: Fix Copyright description
Date: Sun, 15 Dec 2024 00:11:06 +0100
Message-ID: <173421785405.212079.15956339456077528024.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241214071333.3325308-1-andyshrk@163.com>
References: <20241214071333.3325308-1-andyshrk@163.com>
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


On Sat, 14 Dec 2024 15:13:33 +0800, Andy Yan wrote:
> The company name has update to Rockchip Electronics Co., Ltd.
> since 2021.
> And change Co.Ltd to Co., Ltd. to fix mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
> 
> 

Applied, thanks!

[1/1] drm/rockchip: Fix Copyright description
      commit: 041c664da0691a72aca67f72ab6a13789631358e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

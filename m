Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EAF18CDCE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 13:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9785E6EB17;
	Fri, 20 Mar 2020 12:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7A86EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5iMx0vXtQgR8ttF1pDsJGR7JeKT+xrFie+T+HU+y5d0=; b=NZx8x+TAYyKNAmmrk49tIU4Yfp
 792owegak03W4T7aCHC6n6ZQvkDThxqk8TYM4/tpL877rD3bTiJf5USL4iNpwqGuMEAJVl9sVvUbV
 aCZmDHAAnpXW52VuUcqw5Nh31xNYqhstFGUu9ZrtK1aWRJeNoRCN21o71pR007sUmJTY2qNHJNaIF
 kifAYsqwKQSPStxjKxMPx+cn1d9BZL5o+SVd3xWfBuTT7vzCKqP6nCvE7T933uJD47QryWbuOc7Pe
 cv3PwBAjIDaAuAMknzASLFSPysiAaa+lvo551H2LGIPxSneY4jF7vYWay06uB/Q4aqC2dDlfvQ44n
 ZogxpAxw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51027
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jFGeT-0004O0-AF; Fri, 20 Mar 2020 13:21:25 +0100
Subject: Re: [PATCH 2/2] drm/format_helper: Dual licence the header in GPL-2
 and MIT
To: Emmanuel Vadot <manu@FreeBSD.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 matthew.d.roper@intel.com, kraxel@redhat.com, tglx@linutronix.de
References: <20200320022114.2234-1-manu@FreeBSD.org>
 <20200320022114.2234-2-manu@FreeBSD.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <eb1c122e-808e-1dd4-b15b-b7edbc50e0be@tronnes.org>
Date: Fri, 20 Mar 2020 13:21:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320022114.2234-2-manu@FreeBSD.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjAuMDMuMjAyMCAwMy4yMSwgc2tyZXYgRW1tYW51ZWwgVmFkb3Q6Cj4gU291cmNlIGZp
bGUgd2FzIGR1YWwgbGljZW5jZWQgYnV0IHRoZSBoZWFkZXIgd2FzIG9taXR0ZWQsIGZpeCB0aGF0
Lgo+IENvbnRyaWJ1dG9ycyBmb3IgdGhpcyBmaWxlIGFyZToKPiBOb3JhbGYgVHLDuG5uZXMgPG5v
cmFsZkB0cm9ubmVzLm9yZz4KPiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBF
bW1hbnVlbCBWYWRvdCA8bWFudUBGcmVlQlNELm9yZz4KPiAtLS0KCkFja2VkLWJ5OiBOb3JhbGYg
VHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==

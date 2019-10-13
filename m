Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECDFD5868
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 23:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BDA6E064;
	Sun, 13 Oct 2019 21:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F0F6E064
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 21:57:52 +0000 (UTC)
Received: from i59f7e0c5.versanet.de ([89.247.224.197] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iJlry-0004uB-PY; Sun, 13 Oct 2019 23:57:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm/rockchip: include rockchip_drm_drv.h
Date: Sun, 13 Oct 2019 23:57:36 +0200
Message-ID: <12674451.zEyZYcXUJe@phil>
In-Reply-To: <20191009132134.18384-1-ben.dooks@codethink.co.uk>
References: <20191009132134.18384-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-kernel@lists.codethink.co.uk, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIDkuIE9rdG9iZXIgMjAxOSwgMTU6MjE6MzQgQ0VTVCBzY2hyaWViIEJlbiBE
b29rczoKPiBJbmNsdWRlIHJvY2tjaGlwX2RybV9kcnYuaCBmb3IgZGVmaW5pdGlvbiBvZiB2b3Bf
cGxhdGZvcm1fZHJpdmVyCj4gdG8gYXZvaWQgdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2FybmluZzoK
PiAKPiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jOjk4MjoyNDog
d2FybmluZzogc3ltYm9sICd2b3BfcGxhdGZvcm1fZHJpdmVyJyB3YXMgbm90IGRlY2xhcmVkLiBT
aG91bGQgaXQgYmUgc3RhdGljPwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRv
b2tzQGNvZGV0aGluay5jby51az4KCmFwcGxpZWQgdG8gZHJtLW1pc2MtbmV4dAoKVGhhbmtzCkhl
aWtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

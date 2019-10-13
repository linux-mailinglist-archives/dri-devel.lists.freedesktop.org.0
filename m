Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084F6D5869
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 23:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BF8B6E110;
	Sun, 13 Oct 2019 21:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ABF6E110
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 21:58:02 +0000 (UTC)
Received: from i59f7e0c5.versanet.de ([89.247.224.197] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iJlsE-0004uO-RZ; Sun, 13 Oct 2019 23:57:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] drm/rockchip: make rockchip_gem_alloc_object static
Date: Sun, 13 Oct 2019 23:57:53 +0200
Message-ID: <4332900.Is0gsZspTc@phil>
In-Reply-To: <20191009121022.17478-1-ben.dooks@codethink.co.uk>
References: <20191009121022.17478-1-ben.dooks@codethink.co.uk>
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
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTWl0dHdvY2gsIDkuIE9rdG9iZXIgMjAxOSwgMTQ6MTA6MjIgQ0VTVCBzY2hyaWViIEJlbiBE
b29rczoKPiBUaGUgcm9ja2NoaXBfZ2VtX2FsbG9jX29iamVjdCBmdW5jdGlvbiBpcyBub3QgZXhw
b3J0ZWQgc28KPiBtYWtlIGl0IHN0YXRpYyB0byBhdm9pZCB0aGUgZm9sbG93aW5nIHNwYXJzZSB3
YXJuaW5nOgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmM6
Mjk3OjI4OiB3YXJuaW5nOiBzeW1ib2wgJ3JvY2tjaGlwX2dlbV9hbGxvY19vYmplY3QnIHdhcyBu
b3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/Cj4gCj4gU2lnbmVkLW9mZi1ieTogQmVu
IERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgoKYXBwbGllZCB0byBkcm0tbWlzYy1u
ZXh0CgpUaGFua3MKSGVpa28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

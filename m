Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E152FD348F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 01:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291F96E3C4;
	Thu, 10 Oct 2019 23:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236E46E3C4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 23:46:36 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iIi8a-0007dV-Is; Fri, 11 Oct 2019 01:46:28 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Nickey Yang <nickey.yang@rock-chips.com>
Subject: Re: [PATCH 1/1] drm/rockchip: vop: add the definition of dclk_pol
Date: Fri, 11 Oct 2019 01:46:28 +0200
Message-ID: <6985432.6H6HJzKCHW@diego>
In-Reply-To: <20191010034452.20260-2-nickey.yang@rock-chips.com>
References: <20191010034452.20260-1-nickey.yang@rock-chips.com>
 <20191010034452.20260-2-nickey.yang@rock-chips.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgMTAuIE9rdG9iZXIgMjAxOSwgMDU6NDQ6NTIgQ0VTVCBzY2hyaWViIE5p
Y2tleSBZYW5nOgo+IFNvbWUgVk9QJ3MgKHN1Y2ggYXMgcHgzMCkgZGNsa19wb2wgYml0IGlzIGF0
IHRoZSBsYXN0Lgo+IFNvIGl0IGlzIG5lY2Vzc2FyeSB0byBkaXN0aW5ndWlzaCBkY2xrX3BvbCBh
bmQgcGluX3BvbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaWNrZXkgWWFuZyA8bmlja2V5LnlhbmdA
cm9jay1jaGlwcy5jb20+CgpvbgotIHB4MzAgd2l0aCBkc2kgLi4uIGZpeGluZyB0aGUgZGlzcGxh
eSBpc3N1ZSBJIGhhZAotIHJrMzMyOCB3aXRoIGhkbWkKLSByazMyODggd2l0aCBlZHAKLSByazMz
OTkgd2l0aCBlZHAKClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

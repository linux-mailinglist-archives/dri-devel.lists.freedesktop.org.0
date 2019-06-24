Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BFC509D0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 13:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED9C89BB2;
	Mon, 24 Jun 2019 11:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC9789BB2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:31:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54BBD323;
 Mon, 24 Jun 2019 13:31:38 +0200 (CEST)
Date: Mon, 24 Jun 2019 14:31:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] MAINTAINERS: Update Maintainers and Reviewers of DRM
 Bridge Drivers
Message-ID: <20190624113119.GD5737@pendragon.ideasonboard.com>
References: <20190624090851.17859-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190624090851.17859-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1561375898;
 bh=TTMoZ7L0TvwNHbazuq/zwIiZIs9paL/P68Ui7Cjouyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T7DpsKTaR9/3ZvSzOgeS4b4LBK0i6+ZgRoYkX5bXOyfnMgVGltTTwbeRfO5UvHdJq
 +WxmuSTy/Ntp1eSlzg0Rdq0nSpBDb65EAdSVbztbt2xVD/0emnxYtHgwrKngW9SgVO
 A+JWXhl8xhRUcE54OrD9xsC0Z9pII1FxMorvqcDs=
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
Cc: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmVpbCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBKdW4gMjQsIDIwMTkg
YXQgMTE6MDg6NTFBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gQWRkIG15c2VsZiBh
cyBjby1tYWludGFpbmVyIG9mIERSTSBCcmlkZ2UgRHJpdmVycyB0aGVuIGFkZCBKb25hcyBLYXJs
bWFuCj4gYW5kIEplcm5laiDFoGtyYWJlYyBhcyBSZXZpZXdlcnMgb2YgRFJNIEJyaWRnZSBEcml2
ZXJzLgo+IAo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+Cj4gQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiBDYzogQW5k
cnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogSmVybmVqIMWga3JhYmVjIDxq
ZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJl
LmNvbT4KCkFja2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDMgKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+IGluZGV4IDJhYmY2ZDI4ZGI2NC4uZGQ4ZGFjYzYxZTc5IDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNTI1Myw3ICs1MjUzLDEwIEBA
IFQ6CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MKPiAgCj4g
IERSTSBEUklWRVJTIEZPUiBCUklER0UgQ0hJUFMKPiAgTToJQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4KPiArTToJTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+ICBSOglMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+Cj4gK1I6CUpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiArUjoJSmVybmVq
IFNrcmFiZWMgPGplcm5lai5za3JhYmVjQHNpb2wubmV0Pgo+ICBTOglNYWludGFpbmVkCj4gIFQ6
CWdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MKPiAgRjoJZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS8KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549A3347619
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35D76E9B2;
	Wed, 24 Mar 2021 10:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A546E9B2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:27:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2BF9580;
 Wed, 24 Mar 2021 11:27:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616581671;
 bh=jX/rL9SThiDdwKt+QT470qBbeWnwAKKXbWin9BMzKGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q1PPh8/Wn91HuGwqpoEoS0Xjf8J0F7S+fj4EWJbWe6VkHU6FVm8Y1CDsW5P+v/ctx
 E9StN8iohlydMwsnLfwHR6pncDH80LlI0ri+fBcYC3mITxZsVFmKP2WrhsJ5wBvmHo
 LRDd2WWqRsdiy4JIIZt8yvXk/t3692YM3VUZSk90=
Date: Wed, 24 Mar 2021 12:27:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1] MAINTAINERS: Update Maintainers of DRM Bridge Drivers
Message-ID: <YFsT++Nxd2qhtHO0@pendragon.ideasonboard.com>
References: <20210324102019.1251744-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210324102019.1251744-1-robert.foss@linaro.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iLAoKT24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMTE6MjA6MTlBTSArMDEwMCwgUm9iZXJ0
IEZvc3Mgd3JvdGU6Cj4gQWRkIG15c2VsZiBhcyBjby1tYWludGFpbmVyIG9mIERSTSBCcmlkZ2Ug
RHJpdmVycy4gUmVwb3NpdG9yeQo+IGNvbW1pdCBhY2Nlc3MgaGFzIGFscmVhZHkgYmVlbiBncmFu
dGVkLgo+IAo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9mcmVlZGVza3RvcC9mcmVl
ZGVza3RvcC8tL2lzc3Vlcy8zMzgKPiAKPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdA
YmF5bGlicmUuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cj4gQ2M6IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiBD
YzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiBDYzogSmVybmVqIMWga3Jh
YmVjIDxqZXJuZWouc2tyYWJlY0BzaW9sLm5ldD4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPgo+IFNpZ25lZC1vZmYtYnk6IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5h
cm8ub3JnPgoKQWNrZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KCmFuZCB3ZWxjb21lIDotKQoKPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAx
ICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCA0YjcwNWJhNTFjNTQuLjE2YWNlOGY1ODY0
OSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTU5
MDIsNiArNTkwMiw3IEBAIEY6CWRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy8KPiAgRFJNIERS
SVZFUlMgRk9SIEJSSURHRSBDSElQUwo+ICBNOglBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1
bmcuY29tPgo+ICBNOglOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4g
K006CVJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3JnPgo+ICBSOglMYXVyZW50IFBp
bmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gIFI6CUpvbmFzIEth
cmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KPiAgUjoJSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3Jh
YmVjQHNpb2wubmV0PgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

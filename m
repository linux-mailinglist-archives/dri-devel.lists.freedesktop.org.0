Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8072C9C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 12:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C91E6E504;
	Wed, 24 Jul 2019 10:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD476E504
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 10:51:37 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hqErv-0000EO-EF; Wed, 24 Jul 2019 12:51:35 +0200
Message-ID: <1563965495.2914.5.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: remove unused function
 etnaviv_gem_mapping_reference
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Wed, 24 Jul 2019 12:51:35 +0200
In-Reply-To: <20190705171536.26727-2-l.stach@pengutronix.de>
References: <20190705171536.26727-1-l.stach@pengutronix.de>
 <20190705171536.26727-2-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA3LTA1IGF0IDE5OjE1ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBI
YXNuJ3QgYmVlbiB1c2VkIGZvciBxdWl0ZSBhIHdoaWxlLiBUaGVyZSBpcyBubyBwb2ludCBpbiBr
ZWVwaW5nCj4gdW51c2VkIGNvZGUgYXJvdW5kLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0
YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBoaWxpcHAKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmMgfCAxMiAtLS0tLS0tLS0tLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uaCB8ICAxIC0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2Vt
LmMKPiBpbmRleCA3MjdiYjNmNWNlYjIuLmUxOTlhNjgzM2ZmMCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2V0bmF2aXYvZXRuYXZpdl9nZW0uYwo+IEBAIC0yMzUsMTggKzIzNSw2IEBAIGV0bmF2aXZfZ2Vt
X2dldF92cmFtX21hcHBpbmcoc3RydWN0IGV0bmF2aXZfZ2VtX29iamVjdCAqb2JqLAo+ICAJcmV0
dXJuIE5VTEw7Cj4gIH0KPiAgCj4gLXZvaWQgZXRuYXZpdl9nZW1fbWFwcGluZ19yZWZlcmVuY2Uo
c3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICptYXBwaW5nKQo+IC17Cj4gLQlzdHJ1Y3QgZXRu
YXZpdl9nZW1fb2JqZWN0ICpldG5hdml2X29iaiA9IG1hcHBpbmctPm9iamVjdDsKPiAtCj4gLQlk
cm1fZ2VtX29iamVjdF9nZXQoJmV0bmF2aXZfb2JqLT5iYXNlKTsKPiAtCj4gLQltdXRleF9sb2Nr
KCZldG5hdml2X29iai0+bG9jayk7Cj4gLQlXQVJOX09OKG1hcHBpbmctPnVzZSA9PSAwKTsKPiAt
CW1hcHBpbmctPnVzZSArPSAxOwo+IC0JbXV0ZXhfdW5sb2NrKCZldG5hdml2X29iai0+bG9jayk7
Cj4gLX0KPiAtCj4gIHZvaWQgZXRuYXZpdl9nZW1fbWFwcGluZ191bnJlZmVyZW5jZShzdHJ1Y3Qg
ZXRuYXZpdl92cmFtX21hcHBpbmcgKm1hcHBpbmcpCj4gIHsKPiAgCXN0cnVjdCBldG5hdml2X2dl
bV9vYmplY3QgKmV0bmF2aXZfb2JqID0gbWFwcGluZy0+b2JqZWN0Owo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5oIGIvZHJpdmVycy9ncHUvZHJtL2V0
bmF2aXYvZXRuYXZpdl9nZW0uaAo+IGluZGV4IDc1M2M0NTg0OTdkMC4uZDdkOGE4MzVmMzc5IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtLmgKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbS5oCj4gQEAgLTEyMCw3ICsxMjAs
NiBAQCB2b2lkIGV0bmF2aXZfZ2VtX3B1dF9wYWdlcyhzdHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0
ICpvYmopOwo+ICAKPiAgc3RydWN0IGV0bmF2aXZfdnJhbV9tYXBwaW5nICpldG5hdml2X2dlbV9t
YXBwaW5nX2dldCgKPiAgCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3QgZXRuYXZp
dl9ncHUgKmdwdSk7Cj4gLXZvaWQgZXRuYXZpdl9nZW1fbWFwcGluZ19yZWZlcmVuY2Uoc3RydWN0
IGV0bmF2aXZfdnJhbV9tYXBwaW5nICptYXBwaW5nKTsKPiAgdm9pZCBldG5hdml2X2dlbV9tYXBw
aW5nX3VucmVmZXJlbmNlKHN0cnVjdCBldG5hdml2X3ZyYW1fbWFwcGluZyAqbWFwcGluZyk7Cj4g
IAo+ICAjZW5kaWYgLyogX19FVE5BVklWX0dFTV9IX18gKi8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

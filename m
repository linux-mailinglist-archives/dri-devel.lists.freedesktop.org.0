Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6297D865
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 11:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332536E435;
	Thu,  1 Aug 2019 09:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B036E435
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 09:22:15 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ht7Hq-0006NF-1N; Thu, 01 Aug 2019 11:22:14 +0200
Message-ID: <1564651333.7439.14.camel@pengutronix.de>
Subject: Re: [PATCH] etnaviv: fix whitespace errors
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 01 Aug 2019 11:22:13 +0200
In-Reply-To: <20190731212944.3819-1-christian.gmeiner@gmail.com>
References: <20190731212944.3819-1-christian.gmeiner@gmail.com>
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
Cc: etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gV2VkLCAyMDE5LTA3LTMxIGF0IDIzOjI5ICswMjAwLCBDaHJpc3Rp
YW4gR21laW5lciB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR21laW5lciA8Y2hy
aXN0aWFuLmdtZWluZXJAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X3BlcmZtb24uYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfcGVyZm1vbi5jCj4gaW5kZXggNDIyN2E0MDA2YzM0Li4wNmU2ZDNlZTFjMzQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9wZXJmbW9uLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3BlcmZtb24uYwo+IEBAIC0xNSw4ICsxNSw4
IEBAIHN0cnVjdCBldG5hdml2X3BtX3NpZ25hbCB7Cj4gIAl1MzIgZGF0YTsKPiAgCj4gIAl1MzIg
KCpzYW1wbGUpKHN0cnVjdCBldG5hdml2X2dwdSAqZ3B1LAo+IC0JICAgICAgICAgICAgICBjb25z
dCBzdHJ1Y3QgZXRuYXZpdl9wbV9kb21haW4gKmRvbWFpbiwKPiAtCSAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGV0bmF2aXZfcG1fc2lnbmFsICpzaWduYWwpOwo+ICsJCQkJICBjb25zdCBzdHJ1
Y3QgZXRuYXZpdl9wbV9kb21haW4gKmRvbWFpbiwKPiArCQkJCSAgY29uc3Qgc3RydWN0IGV0bmF2
aXZfcG1fc2lnbmFsICpzaWduYWwpOwoKVGhhdCBzaWxlbmNlcyBhIGNoZWNrcGF0Y2ggZXJyb3Is
IGJ1dCBub3cgdGhlIGFsaWdubWVudCB0byB0aGUKb3BlbmluZyBwYXJlbnRoZXNpcyBpcyBnb25l
LgpIb3cgYWJvdXQgdXNpbmcgdHdvIHRhYnMgYW5kIHNpeCBzcGFjZXMgaW5zdGVhZD8KCnJlZ2Fy
ZHMKUGhpbGlwcApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

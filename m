Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F250C0533
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 14:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCABA6E041;
	Fri, 27 Sep 2019 12:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 110146E044
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 12:33:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4492F1000;
 Fri, 27 Sep 2019 05:33:27 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24EDC3F67D;
 Fri, 27 Sep 2019 05:33:27 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id D747268295D; Fri, 27 Sep 2019 13:33:25 +0100 (BST)
Date: Fri, 27 Sep 2019 13:33:25 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH] drm/komeda: Fix typos in komeda_splitter_validate
Message-ID: <20190927123325.zkyttahfysypl6mv@e110455-lin.cambridge.arm.com>
References: <20190920151117.22725-1-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920151117.22725-1-mihail.atanassov@arm.com>
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMjAsIDIwMTkgYXQgMDM6MTE6MzRQTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBGaXggYm90aCB0aGUgc3RyaW5nIGFuZCB0aGUgc3RydWN0IG1lbWJlciBiZWlu
ZyBwcmludGVkLgo+IAo+IEZpeGVzOiAyNjRiOTQzNmQyM2IgKCJkcm0va29tZWRhOiBFbmFibGUg
d3JpdGViYWNrIHNwbGl0IHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNz
b3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUuYyB8IDQgKystLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9z
dGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmVfc3RhdGUuYwo+IGluZGV4IDk1MDIzNWFmMWU3OS4uZGU2NGE2YTk5NjRlIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0
YXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZV9zdGF0ZS5jCj4gQEAgLTU2NCw4ICs1NjQsOCBAQCBrb21lZGFfc3BsaXR0ZXJfdmFs
aWRhdGUoc3RydWN0IGtvbWVkYV9zcGxpdHRlciAqc3BsaXR0ZXIsCj4gIAl9Cj4gIAo+ICAJaWYg
KCFpbl9yYW5nZSgmc3BsaXR0ZXItPnZzaXplLCBkZmxvdy0+aW5faCkpIHsKPiAtCQlEUk1fREVC
VUdfQVRPTUlDKCJzcGxpdCBpbl9pbjogJWQgZXhjZWVkIHRoZSBhY2NlcHRhYmxlIHJhbmdlLlxu
IiwKPiAtCQkJCSBkZmxvdy0+aW5fdyk7Cj4gKwkJRFJNX0RFQlVHX0FUT01JQygic3BsaXQgaW5f
aDogJWQgZXhjZWVkIHRoZSBhY2NlcHRhYmxlIHJhbmdlLlxuIiwKCkJlaW5nIHBlZGFuZGljOiBz
L2V4Y2VlZC9leGNlZWRzLy4KCkJlc3QgcmVnYXJkcywKTGl2aXUKCj4gKwkJCQkgZGZsb3ctPmlu
X2gpOwo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKPiAtLSAKPiAyLjIzLjAKPiAKCi0t
IAo9PT09PT09PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3Js
ZCwgIHwKfCBidXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBj
b2RlISAgLwogIC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

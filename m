Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8935B29
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 13:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905E28986D;
	Wed,  5 Jun 2019 11:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD7818986D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 11:20:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADF07374;
 Wed,  5 Jun 2019 04:20:24 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EDB53F5AF;
 Wed,  5 Jun 2019 04:20:24 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id D81B6682412; Wed,  5 Jun 2019 12:20:22 +0100 (BST)
Date: Wed, 5 Jun 2019 12:20:22 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
Subject: Re: [PATCH v1 2/2] dt/bindings: drm/komeda: Adds SMMU support for
 D71 devicetree
Message-ID: <20190605112022.GU15316@e110455-lin.cambridge.arm.com>
References: <1556605118-22700-1-git-send-email-lowry.li@arm.com>
 <1556605118-22700-3-git-send-email-lowry.li@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556605118-22700-3-git-send-email-lowry.li@arm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: nd <nd@arm.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 Ayan Halder <Ayan.Halder@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDc6MTk6MzRBTSArMDEwMCwgTG93cnkgTGkgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSB3cm90ZToKPiBVcGRhdGVzIHRoZSBkZXZpY2UtdHJlZSBkb2MgYWJv
dXQgaG93IHRvIGVuYWJsZSBTTU1VIGJ5IGRldmljZXRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
TG93cnkgTGkgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8bG93cnkubGlAYXJtLmNvbT4KClJldmll
d2VkLWJ5OiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywK
TGl2aXUKCj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2FybSxrb21lZGEudHh0IHwgNyArKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvYXJtLGtvbWVkYS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9hcm0sa29tZWRhLnR4dAo+IGluZGV4IDAyYjIyNjUuLmIxMmMwNDUgMTAwNjQ0
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJtLGtv
bWVkYS50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9hcm0sa29tZWRhLnR4dAo+IEBAIC0xMSw2ICsxMSwxMCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
Ogo+ICAgICAgICAtICJwY2xrIjogZm9yIHRoZSBBUEIgaW50ZXJmYWNlIGNsb2NrCj4gIC0gI2Fk
ZHJlc3MtY2VsbHM6IE11c3QgYmUgMQo+ICAtICNzaXplLWNlbGxzOiBNdXN0IGJlIDAKPiArLSBp
b21tdXM6IGNvbmZpZ3VyZSB0aGUgc3RyZWFtIGlkIHRvIElPTU1VLCBNdXN0IGJlIGNvbmZpZ3Vy
ZWQgaWYgd2FudCB0bwo+ICsgICAgZW5hYmxlIGlvbW11IGluIGRpc3BsYXkuIGZvciBob3cgdG8g
Y29uZmlndXJlIHRoaXMgbm9kZSBwbGVhc2UgcmVmZXJlbmNlCj4gKyAgICAgICAgZGV2aWNldHJl
ZS9iaW5kaW5ncy9pb21tdS9hcm0sc21tdS12My50eHQsCj4gKyAgICAgICAgZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9pb21tdS50eHQKPiAgCj4gIFJlcXVpcmVkIHByb3BlcnRpZXMgZm9yIHN1
Yi1ub2RlOiBwaXBlbGluZUBucQo+ICBFYWNoIGRldmljZSBjb250YWlucyBvbmUgb3IgdHdvIHBp
cGVsaW5lIHN1Yi1ub2RlcyAoYXQgbGVhc3Qgb25lKSwgZWFjaAo+IEBAIC00NCw2ICs0OCw5IEBA
IEV4YW1wbGU6Cj4gIAkJaW50ZXJydXB0cyA9IDwwIDE2OCA0PjsKPiAgCQljbG9ja3MgPSA8JmRw
dV9tY2xrPiwgPCZkcHVfYWNsaz47Cj4gIAkJY2xvY2stbmFtZXMgPSAibWNsayIsICJwY2xrIjsK
PiArCQlpb21tdXMgPSA8JnNtbXUgMD4sIDwmc21tdSAxPiwgPCZzbW11IDI+LCA8JnNtbXUgMz4s
Cj4gKwkJCTwmc21tdSA0PiwgPCZzbW11IDU+LCA8JnNtbXUgNj4sIDwmc21tdSA3PiwKPiArCQkJ
PCZzbW11IDg+LCA8JnNtbXUgOT47Cj4gIAo+ICAJCWRwMF9waXBlMDogcGlwZWxpbmVAMCB7Cj4g
IAkJCWNsb2NrcyA9IDwmZnBnYW9zYzI+LCA8JmRwdV9hY2xrPjsKPiAtLSAKPiAxLjkuMQo+IAoK
LS0gCj09PT09PT09PT09PT09PT09PT09CnwgSSB3b3VsZCBsaWtlIHRvIHwKfCBmaXggdGhlIHdv
cmxkLCAgfAp8IGJ1dCB0aGV5J3JlIG5vdCB8CnwgZ2l2aW5nIG1lIHRoZSAgIHwKIFwgc291cmNl
IGNvZGUhICAvCiAgLS0tLS0tLS0tLS0tLS0tCiAgICDCr1xfKOODhClfL8KvCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

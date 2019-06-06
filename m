Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9473536E19
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 10:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0D689349;
	Thu,  6 Jun 2019 08:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B27D89349
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:05:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7A21341;
 Thu,  6 Jun 2019 01:05:48 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A74F03F246;
 Thu,  6 Jun 2019 01:05:48 -0700 (PDT)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 05B66682572; Thu,  6 Jun 2019 09:05:47 +0100 (BST)
Date: Thu, 6 Jun 2019 09:05:46 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [GIT PULL] v5.2 fixes for Arm drivers
Message-ID: <20190606080546.GA25620@e110455-lin.cambridge.arm.com>
References: <20190604144205.GO15316@e110455-lin.cambridge.arm.com>
 <CAPM=9tw+xO6QPcCdtFE_4t5wVrwY0CHdZ4YFNrb13SqOUHVcEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPM=9tw+xO6QPcCdtFE_4t5wVrwY0CHdZ4YFNrb13SqOUHVcEA@mail.gmail.com>
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
Cc: Wen He <wen.he_1@nxp.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI devel <dri-devel@lists.freedesktop.org>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 MaliDP Maintainers <malidp@foss.arm.com>,
 "Lowry Li \(Arm Technology China\)" <lowry.li@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTI6MTE6MTRQTSArMTAwMCwgRGF2ZSBBaXJsaWUgd3Jv
dGU6Cj4gSGkgTGl2aXUsCgpIaSBEYXZlLAoKPiAKPiBkaW06IGM0M2RlNjM2YTQ2OSAoImRybS9r
b21lZGE6IFBvdGVudGlhbCBlcnJvciBwb2ludGVyIGRlcmVmZXJlbmNlIik6Cj4gY29tbWl0dGVy
IFNpZ25lZC1vZmYtYnkgbWlzc2luZy4KPiBkaW06IGM0M2RlNjM2YTQ2OSAoImRybS9rb21lZGE6
IFBvdGVudGlhbCBlcnJvciBwb2ludGVyIGRlcmVmZXJlbmNlIik6Cj4gU0hBMSBpbiBmaXhlcyBs
aW5lIG5vdCBmb3VuZDoKPiBkaW06ICAgICA3ZDMxYjllN2E1NTAgKCJkcm0va29tZWRhOiBBZGQg
a29tZWRhX3BsYW5lL3BsYW5lX2hlbHBlcl9mdW5jcyIpCj4gCj4gVGhlc2UgYXJlIHJlYWwsIHBs
ZWFzZSBmaXggYW5kIHJlc3VibWl0LgoKU29ycnkgYWJvdXQgdGhhdCwgdGhpcyBpcyBub3cgZml4
ZWQhIFBsZWFzZSBwdWxsIQoKQmVzdCByZWdhcmRzLApMaXZpdQoKCj4gCj4gRGF2ZS4KCgpUaGUg
Zm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJhM2UwYjcxNjI5NmE1MDRkOWU2NWZlYTdh
Y2IzNzljODZmZTQyODM6CgogIE1lcmdlIHRhZyAnaW14LWRybS1maXhlcy0yMDE5LTA1LTI5JyBv
ZiBnaXQ6Ly9naXQucGVuZ3V0cm9uaXguZGUvZ2l0L3B6YS9saW51eCBpbnRvIGRybS1maXhlcyAo
MjAxOS0wNS0zMSAwOToxNToyNSArMTAwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0OgoKICBnaXQ6Ly9saW51eC1hcm0ub3JnL2xpbnV4LWxkLmdpdCBtYWxpZHAtZml4
ZXMKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA2ZDEwZGM2MTdiNDEyOGMwNmZjMmE4
OGI0N2ZkYTBhMTgzZmZlMzZjOgoKICBkcm0va29tZWRhOiBQb3RlbnRpYWwgZXJyb3IgcG9pbnRl
ciBkZXJlZmVyZW5jZSAoMjAxOS0wNi0wNiAwOTowMDoyOSArMDEwMCkKCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KRGFuIENh
cnBlbnRlciAoMSk6CiAgICAgIGRybS9rb21lZGE6IFBvdGVudGlhbCBlcnJvciBwb2ludGVyIGRl
cmVmZXJlbmNlCgpMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpICgxKToKICAgICAgZHJt
L2tvbWVkYTogZml4aW5nIG9mIERNQSBtYXBwaW5nIHNnIHNlZ21lbnQgd2FybmluZwoKUm9iaW4g
TXVycGh5ICgyKToKICAgICAgZHJtL2FybS9oZGxjZDogQWN0dWFsbHkgdmFsaWRhdGUgQ1JUQyBt
b2RlcwogICAgICBkcm0vYXJtL2hkbGNkOiBBbGxvdyBhIGJpdCBvZiBjbG9jayB0b2xlcmFuY2UK
CldlbiBIZSAoMSk6CiAgICAgIGRybS9hcm0vbWFsaS1kcDogQWRkIGEgbG9vcCBhcm91bmQgdGhl
IHNlY29uZCBzZXQgQ1ZBTCBhbmQgdHJ5IDUgdGltZXMKCll1ZUhhaWJpbmcgKDEpOgogICAgICBk
cm0va29tZWRhOiByZW1vdmUgc2V0IGJ1dCBub3QgdXNlZCB2YXJpYWJsZSAna2NydGMnCgpqYW1l
cyBxaWFuIHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSAoMSk6CiAgICAgIGRybS9rb21lZGE6
IENvbnN0aWZ5IHRoZSB1c2FnZSBvZiBrb21lZGFfY29tcG9uZW50L3BpcGVsaW5lL2Rldl9mdW5j
cwoKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQu
YyB8ICA4ICsrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9k
NzFfZGV2LmMgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgICAgICAgIHwgIDYgKysrKystCiBkcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgICAgICAgfCAgOCArKysrKy0tLQog
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuYyAgIHwg
IDQgKystLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmUuaCAgIHwgMTAgKysrKystLS0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfcGxhbmUuYyAgICAgIHwgIDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9oZGxj
ZF9jcnRjLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hcm0vbWFsaWRwX2Rydi5jICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsr
KysrKysrKysrKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDI5IGRlbGV0
aW9ucygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1927528F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832B26E454;
	Wed, 23 Sep 2020 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6361A6E845
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 09:24:15 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.163])
 by smtphy.263.net (Postfix) with ESMTPS id 98F4F1200D9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 17:24:13 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.182])
 by regular2.263xmail.com (Postfix) with ESMTP id DC100253
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 17:24:08 +0800 (CST)
Received: from localhost (unknown [192.168.167.13])
 by regular1.263xmail.com (Postfix) with ESMTP id 62346A68;
 Tue, 22 Sep 2020 17:24:04 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.39] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P1667T140083434874624S1600766643869388_; 
 Tue, 22 Sep 2020 17:24:04 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <3d1b9ba311f8b2689ef786b578f4e2f9>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: linux-rockchip@lists.infradead.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_1/3=5d_drm=3a_rockchip=3a_hdmi=3a_remove_v?=
 =?UTF-8?B?b3BfY3J0Y19tb2RlX2ZpeHVwIHRvIGZpeCBjbG9jayBoYW5kbGluZ+OAkOivtw==?=
 =?UTF-8?B?5rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcythbmR5Lnlh?=
 =?UTF-8?B?bj1yb2NrLWNoaXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQub3Jn5Luj5Y+R44CR?=
To: Andy Yan <andy.yan@rock-chips.com>, Vicente Bergas <vicencb@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
References: <20200921181803.1160-1-vicencb@gmail.com>
 <20200921181803.1160-2-vicencb@gmail.com>
 <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
From: crj <algea.cao@rock-chips.com>
Message-ID: <1ada2daf-16f3-191f-ccc1-d3d7d0c319fc@rock-chips.com>
Date: Tue, 22 Sep 2020 17:24:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8gVmljZW50ZSwKCuWcqCAyMDIwLzkvMjIgMTU6NDAsIEFuZHkgWWFuIOWGmemBkzoKPiBB
ZGQgb3VyIEhETUkgZHJpdmVyIG93bmVyIEFsZ2VhIHRvIGxpc3QuCj4KPiBPbiA5LzIyLzIwIDI6
MTggQU0sIFZpY2VudGUgQmVyZ2FzIHdyb3RlOgo+PiBVbmRlciBjZXJ0YWluIGNvbmRpdGlvbnMg
dm9wX2NydGNfbW9kZV9maXh1cCByb3VuZHMgdGhlIGNsb2NrCgoKTWF5IEkgYXNrIHVuZGVyIHdo
YXQgY29uZGl0aW9ucyB0aGF0IHRoZSBjbG9jayBvZiBIRE1JIHdpbGwKCmJlIGNoYW5nZWQgdG8g
MTQ4NTAxMDAwP8KgIEluIGdlbmVyYWwsIHRoZSBkZXNjcmlwdGlvbiBvZiBjbG9jawoKaW4gRURJ
RCB3aWxsIG5vdCBiZSBkZXRhaWxlZCBiZWxvdyB0aGUgdGhvdXNhbmRzIHBsYWNlLgoKCj4+Cj4+
IDE0ODUwMDAwMCB0byAxNDg1MDEwMDAgd2hpY2ggbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBlcnJv
cjoKPj4gZHdoZG1pLXJvY2tjaGlwIGZmOTQwMDAwLmhkbWk6IFBIWSBjb25maWd1cmF0aW9uIGZh
aWxlZCAoY2xvY2sgCj4+IDE0ODUwMTAwMCkKPj4KPj4gVGhlIGlzc3VlIHdhcyBmb3VuZCBvbiBS
SzMzOTkgYm9vdGluZyB3aXRoIHUtYm9vdC4gVS1ib290IGNvbmZpZ3VyZXMgdGhlCj4+IGRpc3Bs
YXkgYXQgMjU2MHgxNDQwIGFuZCB0aGVuIGxpbnV4IGNvbWVzIHVwIHdpdGggYSBibGFjayBzY3Jl
ZW4uCj4+IEEgd29ya2Fyb3VuZCB3YXMgdG8gdW4tcGx1ZyBhbmQgcmUtcGx1ZyB0aGUgSERNSSBk
aXNwbGF5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWaWNlbnRlIEJlcmdhcyA8dmljZW5jYkBnbWFp
bC5jb20+Cj4+IFRlc3RlZC1ieTogVmljZW50ZSBCZXJnYXMgPHZpY2VuY2JAZ21haWwuY29tPgo+
PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYyB8
IDQ1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNDUgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX3ZvcC5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
dm9wLmMKPj4gaW5kZXggYzgwZjdkOWZkMTNmLi5mZTgwZGE2NTI5OTQgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+PiBAQCAtMTE0Miw1MCAr
MTE0Miw2IEBAIHN0YXRpYyB2b2lkIHZvcF9jcnRjX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCAKPj4g
ZHJtX2NydGMgKmNydGMpCj4+IMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdm9w
LT5pcnFfbG9jaywgZmxhZ3MpOwo+PiDCoCB9Cj4+IMKgIC1zdGF0aWMgYm9vbCB2b3BfY3J0Y19t
b2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0
ZWRfbW9kZSkKPj4gLXsKPj4gLcKgwqDCoCBzdHJ1Y3Qgdm9wICp2b3AgPSB0b192b3AoY3J0Yyk7
Cj4+IC3CoMKgwqAgdW5zaWduZWQgbG9uZyByYXRlOwo+PiAtCj4+IC3CoMKgwqAgLyoKPj4gLcKg
wqDCoMKgICogQ2xvY2sgY3JhemluZXNzLgo+PiAtwqDCoMKgwqAgKgo+PiAtwqDCoMKgwqAgKiBL
ZXkgcG9pbnRzOgo+PiAtwqDCoMKgwqAgKgo+PiAtwqDCoMKgwqAgKiAtIERSTSB3b3JrcyBpbiBp
biBrSHouCj4+IC3CoMKgwqDCoCAqIC0gQ2xvY2sgZnJhbWV3b3JrIHdvcmtzIGluIEh6Lgo+PiAt
wqDCoMKgwqAgKiAtIFJvY2tjaGlwJ3MgY2xvY2sgZHJpdmVyIHBpY2tzIHRoZSBjbG9jayByYXRl
IHRoYXQgaXMgdGhlCj4+IC3CoMKgwqDCoCAqwqDCoCBzYW1lIF9PUiBMT1dFUl8gdGhhbiB0aGUg
b25lIHJlcXVlc3RlZC4KPj4gLcKgwqDCoMKgICoKPj4gLcKgwqDCoMKgICogQWN0aW9uIHBsYW46
Cj4+IC3CoMKgwqDCoCAqCj4+IC3CoMKgwqDCoCAqIDEuIFdoZW4gRFJNIGdpdmVzIHVzIGEgbW9k
ZSwgd2Ugc2hvdWxkIGFkZCA5OTkgSHogdG8gaXQuwqAgCj4+IFRoYXQgd2F5Cj4+IC3CoMKgwqDC
oCAqwqDCoMKgIGlmIHRoZSBjbG9jayB3ZSBuZWVkIGlzIDYwMDAwMDAxIEh6ICh+NjAgTUh6KSBh
bmQgRFJNIAo+PiB0ZWxscyB1cyB0bwo+PiAtwqDCoMKgwqAgKsKgwqDCoCBtYWtlIDYwMDAwIGtI
eiB0aGVuIHRoZSBjbG9jayBmcmFtZXdvcmsgd2lsbCBhY3R1YWxseSBnaXZlIHVzCj4+IC3CoMKg
wqDCoCAqwqDCoMKgIHRoZSByaWdodCBjbG9jay4KPj4gLcKgwqDCoMKgICoKPj4gLcKgwqDCoMKg
ICrCoMKgwqAgTk9URTogaWYgdGhlIFBMTCAobWF5YmUgdGhyb3VnaCBhIGRpdmlkZXIpIGNvdWxk
IGFjdHVhbGx5IAo+PiBtYWtlCj4+IC3CoMKgwqDCoCAqwqDCoMKgIGEgY2xvY2sgcmF0ZSA5OTkg
SHogaGlnaGVyIGluc3RlYWQgb2YgdGhlIG9uZSB3ZSB3YW50IHRoZW4gCj4+IHRoaXMKPj4gLcKg
wqDCoMKgICrCoMKgwqAgY291bGQgYmUgYSBwcm9ibGVtLsKgIFVuZm9ydHVuYXRlbHkgdGhlcmUn
cyBub3QgbXVjaCB3ZSBjYW4gZG8KPj4gLcKgwqDCoMKgICrCoMKgwqAgc2luY2UgaXQncyBiYWtl
ZCBpbnRvIERSTSB0byB1c2Uga0h6LsKgIEl0IHNob3VsZG4ndCBtYXR0ZXIgaW4KPj4gLcKgwqDC
oMKgICrCoMKgwqAgcHJhY3RpY2Ugc2luY2UgUm9ja2NoaXAgUExMcyBhcmUgY29udHJvbGxlZCBi
eSB0YWJsZXMgYW5kCj4+IC3CoMKgwqDCoCAqwqDCoMKgIGV2ZW4gaWYgdGhlcmUgaXMgYSBkaXZp
ZGVyIGluIHRoZSBtaWRkbGUgSSB3b3VsZG4ndCBleHBlY3QgCj4+IFBMTAo+PiAtwqDCoMKgwqAg
KsKgwqDCoCByYXRlcyBpbiB0aGUgdGFibGUgdGhhdCBhcmUganVzdCBhIGZldyBrSHogZGlmZmVy
ZW50Lgo+PiAtwqDCoMKgwqAgKgo+PiAtwqDCoMKgwqAgKiAyLiBHZXQgdGhlIGNsb2NrIGZyYW1l
d29yayB0byByb3VuZCB0aGUgcmF0ZSBmb3IgdXMgdG8gdGVsbCB1cwo+PiAtwqDCoMKgwqAgKsKg
wqDCoCB3aGF0IGl0IHdpbGwgYWN0dWFsbHkgbWFrZS4KPj4gLcKgwqDCoMKgICoKPj4gLcKgwqDC
oMKgICogMy4gU3RvcmUgdGhlIHJvdW5kZWQgdXAgcmF0ZSBzbyB0aGF0IHdlIGRvbid0IG5lZWQg
dG8gd29ycnkgCj4+IGFib3V0Cj4+IC3CoMKgwqDCoCAqwqDCoMKgIHRoaXMgaW4gdGhlIGFjdHVh
bCBjbGtfc2V0X3JhdGUoKS4KPj4gLcKgwqDCoMKgICovCj4+IC3CoMKgwqAgcmF0ZSA9IGNsa19y
b3VuZF9yYXRlKHZvcC0+ZGNsaywgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgKiAxMDAwICsgCj4+IDk5
OSk7Cj4+IC3CoMKgwqAgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPSBESVZfUk9VTkRfVVAocmF0ZSwg
MTAwMCk7Cj4+IC0KPj4gLcKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4gLX0KPj4gLQo+PiDCoCBzdGF0
aWMgYm9vbCB2b3BfZHNwX2x1dF9pc19lbmFibGVkKHN0cnVjdCB2b3AgKnZvcCkKPj4gwqAgewo+
PiDCoMKgwqDCoMKgIHJldHVybiB2b3BfcmVhZF9yZWcodm9wLCAwLCAmdm9wLT5kYXRhLT5jb21t
b24tPmRzcF9sdXRfZW4pOwo+PiBAQCAtMTUxMiw3ICsxNDY4LDYgQEAgc3RhdGljIHZvaWQgdm9w
X2NydGNfYXRvbWljX2ZsdXNoKHN0cnVjdCAKPj4gZHJtX2NydGMgKmNydGMsCj4+IMKgIH0KPj4g
wqAgwqAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3Mgdm9wX2NydGNf
aGVscGVyX2Z1bmNzID0gewo+PiAtwqDCoMKgIC5tb2RlX2ZpeHVwID0gdm9wX2NydGNfbW9kZV9m
aXh1cCwKPj4gwqDCoMKgwqDCoCAuYXRvbWljX2NoZWNrID0gdm9wX2NydGNfYXRvbWljX2NoZWNr
LAo+PiDCoMKgwqDCoMKgIC5hdG9taWNfYmVnaW4gPSB2b3BfY3J0Y19hdG9taWNfYmVnaW4sCj4+
IMKgwqDCoMKgwqAgLmF0b21pY19mbHVzaCA9IHZvcF9jcnRjX2F0b21pY19mbHVzaCwKPgo+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

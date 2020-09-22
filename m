Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD9A27527E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB146E113;
	Wed, 23 Sep 2020 07:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2939 seconds by postgrey-1.36 at gabe;
 Tue, 22 Sep 2020 10:13:09 UTC
Received: from regular1.263xmail.com (regular1.263xmail.com [211.150.70.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D3389D2F
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 10:13:08 +0000 (UTC)
Received: from localhost (unknown [192.168.167.32])
 by regular1.263xmail.com (Postfix) with ESMTP id CC290974;
 Tue, 22 Sep 2020 18:13:04 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.39] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P19669T139950651582208S1600769583305895_; 
 Tue, 22 Sep 2020 18:13:04 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <f469c07bda61fd24a13ec089fd1bd8ac>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: dianders@chromium.org
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_1/3=5d_drm=3a_rockchip=3a_hdmi=3a_remove_v?=
 =?UTF-8?B?b3BfY3J0Y19tb2RlX2ZpeHVwIHRvIGZpeCBjbG9jayBoYW5kbGluZ+OAkOivtw==?=
 =?UTF-8?B?5rOo5oSP77yM6YKu5Lu255SxbGludXgtcm9ja2NoaXAtYm91bmNlcythbmR5Lnlh?=
 =?UTF-8?B?bj1yb2NrLWNoaXBzLmNvbUBsaXN0cy5pbmZyYWRlYWQub3Jn5Luj5Y+R44CR?=
To: Vicente Bergas <vicencb@gmail.com>
References: <20200921181803.1160-1-vicencb@gmail.com>
 <20200921181803.1160-2-vicencb@gmail.com>
 <76b8f420-2afb-eba9-5c98-6f10762c4b37@rock-chips.com>
 <1ada2daf-16f3-191f-ccc1-d3d7d0c319fc@rock-chips.com>
 <CAAMcf8Az5AVWNzMHuxXda5WUm4_E5QCwpgb2fVtaT0w2+cQELw@mail.gmail.com>
From: crj <algea.cao@rock-chips.com>
Message-ID: <bd2d67ee-4023-ccde-3b2a-e88c3e076d12@rock-chips.com>
Date: Tue, 22 Sep 2020 18:13:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <CAAMcf8Az5AVWNzMHuxXda5WUm4_E5QCwpgb2fVtaT0w2+cQELw@mail.gmail.com>
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:19 +0000
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Yan <andy.yan@rock-chips.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERvdWdsYXMKCuWcqCAyMDIwLzkvMjIgMTc6MzEsIFZpY2VudGUgQmVyZ2FzIOWGmemBkzoK
PiBPbiBUdWUsIFNlcCAyMiwgMjAyMCBhdCAxMToyNCBBTSBjcmogPGFsZ2VhLmNhb0Byb2NrLWNo
aXBzLmNvbT4gd3JvdGU6Cj4+IEhlbGxvIFZpY2VudGUsCj4+Cj4+IOWcqCAyMDIwLzkvMjIgMTU6
NDAsIEFuZHkgWWFuIOWGmemBkzoKPj4+IEFkZCBvdXIgSERNSSBkcml2ZXIgb3duZXIgQWxnZWEg
dG8gbGlzdC4KPj4+Cj4+PiBPbiA5LzIyLzIwIDI6MTggQU0sIFZpY2VudGUgQmVyZ2FzIHdyb3Rl
Ogo+Pj4+IFVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucyB2b3BfY3J0Y19tb2RlX2ZpeHVwIHJvdW5k
cyB0aGUgY2xvY2sKPj4KPj4gTWF5IEkgYXNrIHVuZGVyIHdoYXQgY29uZGl0aW9ucyB0aGF0IHRo
ZSBjbG9jayBvZiBIRE1JIHdpbGwKPj4KPj4gYmUgY2hhbmdlZCB0byAxNDg1MDEwMDA/ICBJbiBn
ZW5lcmFsLCB0aGUgZGVzY3JpcHRpb24gb2YgY2xvY2sKPj4KPj4gaW4gRURJRCB3aWxsIG5vdCBi
ZSBkZXRhaWxlZCBiZWxvdyB0aGUgdGhvdXNhbmRzIHBsYWNlLgo+IFRoZXJlIGlzIG5vIGNsb2Nr
IGluIHRoZSBFRElEIHdpdGggMUtIeiByZXNvbHV0aW9uLCB0aGUgY2xvY2sgaXMKPiAxNDg1MDAw
MDAgd2hpY2ggaGFzIDUwMEtIeiByZXNvbHV0aW9uLgo+IEl0IGlzIHRoZSBmdW5jdGlvbiB2b3Bf
Y3J0Y19tb2RlX2ZpeHVwIHRoYXQgZ2V0cyB4eHgwMDAwIGFuZCByZXR1cm5zIHh4eDEwMDAKCkkg
Y2hlY2tlZCB0aGUgY29tbWl0IG1zZyBvZiBjb21taXQgMjg3NDIyYTk1ZmUyICgiZHJtL3JvY2tj
aGlwOiBSb3VuZCB1cCAKX2JlZm9yZV8gZ2l2aW5nIHRvIHRoZSBjbG9jayBmcmFtZXdvcmsiKS4K
ClJvdW5kIHVwIGhkbWkgY2xvY2sgaXMgZm9yIHNvbWUgcGFuZWxzIHdpdGggc3BlY2lhbCBjbG9j
a3MuwqAgQXJlIHRoZXNlIApwYW5lbHMgY2xvY2sgY2FuJ3QgYmUgZGl2aWRlZCBjb3JyZWN0bHkg
Y29tbW9uPwoKPj4+PiAxNDg1MDAwMDAgdG8gMTQ4NTAxMDAwIHdoaWNoIGxlYWRzIHRvIHRoZSBm
b2xsb3dpbmcgZXJyb3I6Cj4+Pj4gZHdoZG1pLXJvY2tjaGlwIGZmOTQwMDAwLmhkbWk6IFBIWSBj
b25maWd1cmF0aW9uIGZhaWxlZCAoY2xvY2sKPj4+PiAxNDg1MDEwMDApCj4+Pj4KPj4+PiBUaGUg
aXNzdWUgd2FzIGZvdW5kIG9uIFJLMzM5OSBib290aW5nIHdpdGggdS1ib290LiBVLWJvb3QgY29u
ZmlndXJlcyB0aGUKPj4+PiBkaXNwbGF5IGF0IDI1NjB4MTQ0MCBhbmQgdGhlbiBsaW51eCBjb21l
cyB1cCB3aXRoIGEgYmxhY2sgc2NyZWVuLgo+Pj4+IEEgd29ya2Fyb3VuZCB3YXMgdG8gdW4tcGx1
ZyBhbmQgcmUtcGx1ZyB0aGUgSERNSSBkaXNwbGF5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
VmljZW50ZSBCZXJnYXMgPHZpY2VuY2JAZ21haWwuY29tPgo+Pj4+IFRlc3RlZC1ieTogVmljZW50
ZSBCZXJnYXMgPHZpY2VuY2JAZ21haWwuY29tPgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMgfCA0NSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNDUgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+Pj4+
IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwo+Pj4+IGluZGV4
IGM4MGY3ZDlmZDEzZi4uZmU4MGRhNjUyOTk0IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fdm9wLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3ZvcC5jCj4+Pj4gQEAgLTExNDIsNTAgKzExNDIsNiBA
QCBzdGF0aWMgdm9pZCB2b3BfY3J0Y19kaXNhYmxlX3ZibGFuayhzdHJ1Y3QKPj4+PiBkcm1fY3J0
YyAqY3J0YykKPj4+PiAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmdm9wLT5pcnFfbG9j
aywgZmxhZ3MpOwo+Pj4+ICAgIH0KPj4+PiAgICAtc3RhdGljIGJvb2wgdm9wX2NydGNfbW9kZV9m
aXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4+Pj4gLSAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPj4+PiAtICAgICAgICAgICAgICAgIHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlKQo+Pj4+IC17Cj4+Pj4gLSAgICBzdHJ1
Y3Qgdm9wICp2b3AgPSB0b192b3AoY3J0Yyk7Cj4+Pj4gLSAgICB1bnNpZ25lZCBsb25nIHJhdGU7
Cj4+Pj4gLQo+Pj4+IC0gICAgLyoKPj4+PiAtICAgICAqIENsb2NrIGNyYXppbmVzcy4KPj4+PiAt
ICAgICAqCj4+Pj4gLSAgICAgKiBLZXkgcG9pbnRzOgo+Pj4+IC0gICAgICoKPj4+PiAtICAgICAq
IC0gRFJNIHdvcmtzIGluIGluIGtIei4KPj4+PiAtICAgICAqIC0gQ2xvY2sgZnJhbWV3b3JrIHdv
cmtzIGluIEh6Lgo+Pj4+IC0gICAgICogLSBSb2NrY2hpcCdzIGNsb2NrIGRyaXZlciBwaWNrcyB0
aGUgY2xvY2sgcmF0ZSB0aGF0IGlzIHRoZQo+Pj4+IC0gICAgICogICBzYW1lIF9PUiBMT1dFUl8g
dGhhbiB0aGUgb25lIHJlcXVlc3RlZC4KPj4+PiAtICAgICAqCj4+Pj4gLSAgICAgKiBBY3Rpb24g
cGxhbjoKPj4+PiAtICAgICAqCj4+Pj4gLSAgICAgKiAxLiBXaGVuIERSTSBnaXZlcyB1cyBhIG1v
ZGUsIHdlIHNob3VsZCBhZGQgOTk5IEh6IHRvIGl0Lgo+Pj4+IFRoYXQgd2F5Cj4+Pj4gLSAgICAg
KiAgICBpZiB0aGUgY2xvY2sgd2UgbmVlZCBpcyA2MDAwMDAwMSBIeiAofjYwIE1IeikgYW5kIERS
TQo+Pj4+IHRlbGxzIHVzIHRvCj4+Pj4gLSAgICAgKiAgICBtYWtlIDYwMDAwIGtIeiB0aGVuIHRo
ZSBjbG9jayBmcmFtZXdvcmsgd2lsbCBhY3R1YWxseSBnaXZlIHVzCj4+Pj4gLSAgICAgKiAgICB0
aGUgcmlnaHQgY2xvY2suCj4+Pj4gLSAgICAgKgo+Pj4+IC0gICAgICogICAgTk9URTogaWYgdGhl
IFBMTCAobWF5YmUgdGhyb3VnaCBhIGRpdmlkZXIpIGNvdWxkIGFjdHVhbGx5Cj4+Pj4gbWFrZQo+
Pj4+IC0gICAgICogICAgYSBjbG9jayByYXRlIDk5OSBIeiBoaWdoZXIgaW5zdGVhZCBvZiB0aGUg
b25lIHdlIHdhbnQgdGhlbgo+Pj4+IHRoaXMKPj4+PiAtICAgICAqICAgIGNvdWxkIGJlIGEgcHJv
YmxlbS4gIFVuZm9ydHVuYXRlbHkgdGhlcmUncyBub3QgbXVjaCB3ZSBjYW4gZG8KPj4+PiAtICAg
ICAqICAgIHNpbmNlIGl0J3MgYmFrZWQgaW50byBEUk0gdG8gdXNlIGtIei4gIEl0IHNob3VsZG4n
dCBtYXR0ZXIgaW4KPj4+PiAtICAgICAqICAgIHByYWN0aWNlIHNpbmNlIFJvY2tjaGlwIFBMTHMg
YXJlIGNvbnRyb2xsZWQgYnkgdGFibGVzIGFuZAo+Pj4+IC0gICAgICogICAgZXZlbiBpZiB0aGVy
ZSBpcyBhIGRpdmlkZXIgaW4gdGhlIG1pZGRsZSBJIHdvdWxkbid0IGV4cGVjdAo+Pj4+IFBMTAo+
Pj4+IC0gICAgICogICAgcmF0ZXMgaW4gdGhlIHRhYmxlIHRoYXQgYXJlIGp1c3QgYSBmZXcga0h6
IGRpZmZlcmVudC4KPj4+PiAtICAgICAqCj4+Pj4gLSAgICAgKiAyLiBHZXQgdGhlIGNsb2NrIGZy
YW1ld29yayB0byByb3VuZCB0aGUgcmF0ZSBmb3IgdXMgdG8gdGVsbCB1cwo+Pj4+IC0gICAgICog
ICAgd2hhdCBpdCB3aWxsIGFjdHVhbGx5IG1ha2UuCj4+Pj4gLSAgICAgKgo+Pj4+IC0gICAgICog
My4gU3RvcmUgdGhlIHJvdW5kZWQgdXAgcmF0ZSBzbyB0aGF0IHdlIGRvbid0IG5lZWQgdG8gd29y
cnkKPj4+PiBhYm91dAo+Pj4+IC0gICAgICogICAgdGhpcyBpbiB0aGUgYWN0dWFsIGNsa19zZXRf
cmF0ZSgpLgo+Pj4+IC0gICAgICovCj4+Pj4gLSAgICByYXRlID0gY2xrX3JvdW5kX3JhdGUodm9w
LT5kY2xrLCBhZGp1c3RlZF9tb2RlLT5jbG9jayAqIDEwMDAgKwo+Pj4+IDk5OSk7Cj4+Pj4gLSAg
ICBhZGp1c3RlZF9tb2RlLT5jbG9jayA9IERJVl9ST1VORF9VUChyYXRlLCAxMDAwKTsKPj4+PiAt
Cj4+Pj4gLSAgICByZXR1cm4gdHJ1ZTsKPj4+PiAtfQo+Pj4+IC0KPj4+PiAgICBzdGF0aWMgYm9v
bCB2b3BfZHNwX2x1dF9pc19lbmFibGVkKHN0cnVjdCB2b3AgKnZvcCkKPj4+PiAgICB7Cj4+Pj4g
ICAgICAgIHJldHVybiB2b3BfcmVhZF9yZWcodm9wLCAwLCAmdm9wLT5kYXRhLT5jb21tb24tPmRz
cF9sdXRfZW4pOwo+Pj4+IEBAIC0xNTEyLDcgKzE0NjgsNiBAQCBzdGF0aWMgdm9pZCB2b3BfY3J0
Y19hdG9taWNfZmx1c2goc3RydWN0Cj4+Pj4gZHJtX2NydGMgKmNydGMsCj4+Pj4gICAgfQo+Pj4+
ICAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3Mgdm9wX2NydGNf
aGVscGVyX2Z1bmNzID0gewo+Pj4+IC0gICAgLm1vZGVfZml4dXAgPSB2b3BfY3J0Y19tb2RlX2Zp
eHVwLAo+Pj4+ICAgICAgICAuYXRvbWljX2NoZWNrID0gdm9wX2NydGNfYXRvbWljX2NoZWNrLAo+
Pj4+ICAgICAgICAuYXRvbWljX2JlZ2luID0gdm9wX2NydGNfYXRvbWljX2JlZ2luLAo+Pj4+ICAg
ICAgICAuYXRvbWljX2ZsdXNoID0gdm9wX2NydGNfYXRvbWljX2ZsdXNoLAo+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

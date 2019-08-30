Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C3CA3293
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E01E6E33C;
	Fri, 30 Aug 2019 08:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn
 [202.108.3.166])
 by gabe.freedesktop.org (Postfix) with SMTP id BC2CB6E226
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 03:35:25 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([114.254.173.51])
 by sina.com with ESMTP
 id 5D68983600014092; Fri, 30 Aug 2019 11:30:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 9491554965055
From: Hillf Danton <hdanton@sina.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
Date: Fri, 30 Aug 2019 11:29:48 +0800
Message-Id: <20190830032948.13516-1-hdanton@sina.com>
MIME-Version: 1.0
Thread-Topic: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIEZyaSwgMzAgQXVnIDIwMTkgMDY6MDQ6MDYgKzA4MDAgTWlraGFpbCBHYXZyaWxvdiB3cm90
ZToKPiBPbiBTdW4sIEF1ZyAyNSwgMjAxOSBhdCAxMDoxMzowNVBNICswODAwLCBIaWxsZiBEYW50
b24gd3JvdGU6Cj4gPiBDYW4gd2UgdHJ5IHRvIGFkZCB0aGUgZmFsbGJhY2sgdGltZXIgbWFudWFs
bHk/Cj4gPgo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNl
LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4g
PiBAQCAtMzIyLDYgKzMyMiwxMCBAQCBpbnQgYW1kZ3B1X2ZlbmNlX3dhaXRfZW1wdHkoc3RydWN0
IGFtZGdwCj4gPiAgICAgICAgIH0KPiA+ICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4gPiAK
PiA+ICsgICAgICAgaWYgKCF0aW1lcl9wZW5kaW5nKCZyaW5nLT5mZW5jZV9kcnYuZmFsbGJhY2tf
dGltZXIpKQo+ID4gKyAgICAgICAgICAgICAgIG1vZF90aW1lcigmcmluZy0+ZmVuY2VfZHJ2LmZh
bGxiYWNrX3RpbWVyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgamlmZmllcyArIChBTURH
UFVfRkVOQ0VfSklGRklFU19USU1FT1VUIDw8IDEpKTsKPiA+ICsKPiA+ICAgICAgICAgciA9IGRt
YV9mZW5jZV93YWl0KGZlbmNlLCBmYWxzZSk7Cj4gPiAgICAgICAgIGRtYV9mZW5jZV9wdXQoZmVu
Y2UpOwo+ID4gICAgICAgICByZXR1cm4gcjsKPiA+IC0tCj4gPgo+ID4gT3Igc2ltcGx5IHdhaXQg
d2l0aCBhbiBlYXIgb24gc2lnbmFsIGFuZCB0aW1lb3V0IGlmIGFkZGluZyB0aW1lcgo+ID4gc2Vl
bXMgdG8gZ28gYSBiaXQgdG9vIGZhcj8KPiA+Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ZlbmNlLmMKPiA+IEBAIC0zMjIsNyArMzIyLDEyIEBAIGludCBhbWRncHVfZmVu
Y2Vfd2FpdF9lbXB0eShzdHJ1Y3QgYW1kZ3AKPiA+ICAgICAgICAgfQo+ID4gICAgICAgICByY3Vf
cmVhZF91bmxvY2soKTsKPiA+IAo+ID4gLSAgICAgICByID0gZG1hX2ZlbmNlX3dhaXQoZmVuY2Us
IGZhbHNlKTsKPiA+ICsgICAgICAgaWYgKDAgPCBkbWFfZmVuY2Vfd2FpdF90aW1lb3V0KGZlbmNl
LCB0cnVlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBTURHUFVfRkVOQ0Vf
SklGRklFU19USU1FT1VUICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKEFN
REdQVV9GRU5DRV9KSUZGSUVTX1RJTUVPVVQgPj4gMykpKQo+ID4gKyAgICAgICAgICAgICAgIHIg
PSAwOwo+ID4gKyAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgciA9IC1FSU5WQUw7Cj4g
PiAgICAgICAgIGRtYV9mZW5jZV9wdXQoZmVuY2UpOwoKCQlXQVJOKHIsICJnbm9tZSBzaGVsbCBz
dHVjayB3YXJuaW5nXG4iKTsKCj4gPiAgICAgICAgIHJldHVybiByOwo+ID4gIH0KPiAKPiBJIHRl
c3RlZCBib3RoIHBhdGNoZXMgb24gdG9wIG9mIDUuMyBSQzYuIEVhY2ggcGF0Y2ggSSB3YXMgdGVz
dGVkIG1vcmUKPiB0aGFuIDI0IGhvdXJzIGFuZCBJIGRvbid0IHNlZW4gYW55IHJlZ3Jlc3Npb25z
IG9yIHByb2JsZW1zIHdpdGggdGhlbS4KPiAKQWRkIGEgd2FybmluZyB0byBzaG93IGlmIGl0IG1h
a2VzIHNlbnNlIGluIGZpZWxkOiBuZWl0aGVyIHJlZ3Jlc3Npb24gbm9yCnByb2JsZW0gd2lsbCBo
YXZlIGJlZW4gb2JzZXJ2ZWQgd2l0aCB0aGUgd2FybmluZyBwcmludGVkLgoKVGhhbmtzCkhpbGxm
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DDF6F269
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jul 2019 11:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B2C89B84;
	Sun, 21 Jul 2019 09:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A2189B84
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2019 09:38:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 752D820067;
 Sun, 21 Jul 2019 11:38:16 +0200 (CEST)
Date: Sun, 21 Jul 2019 11:38:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel: simple: Doxygenize 'struct panel_desc';
 rename a few functions
Message-ID: <20190721093815.GA4375@ravnborg.org>
References: <20190712163333.231884-1-dianders@chromium.org>
 <20190717173317.GA4862@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717173317.GA4862@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=cm27Pg_UAAAA:8 a=Ou5vyIR7_VdEBx-5QFgA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Zy4KCk9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDA3OjMzOjE3UE0gKzAyMDAsIFNhbSBS
YXZuYm9yZyB3cm90ZToKPiBIaSBEb3VnLgo+IAo+IE9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDA5
OjMzOjMzQU0gLTA3MDAsIERvdWdsYXMgQW5kZXJzb24gd3JvdGU6Cj4gPiBUaGlzIGF0dGVtcHRz
IHRvIGFkZHJlc3Mgb3V0c3RhbmRpbmcgcmV2aWV3IGZlZWRiYWNrIGZyb20gY29tbWl0Cj4gPiBi
OGEyOTQ4ZmEyYjMgKCJkcm0vcGFuZWw6IHNpbXBsZTogQWRkIGFiaWxpdHkgdG8gb3ZlcnJpZGUg
dHlwaWNhbAo+ID4gdGltaW5nIikuICBTcGVjaWZpY2FsbHk6Cj4gPiAKPiA+ICogSXQgd2FzIHJl
cXVlc3RlZCB0aGF0IEkgZG9jdW1lbnQgKGluIHRoZSBzdHJ1Y3R1cmUgZGVmaW5pdGlvbikgdGhh
dAo+ID4gICB0aGUgZGV2aWNlIHRyZWUgb3ZlcnJpZGUgaGFkIG5vIGVmZmVjdCBpZiAnc3RydWN0
IGRybV9kaXNwbGF5X21vZGUnCj4gPiAgIHdhcyB1c2VkIGluIHRoZSBwYW5lbCBkZXNjcmlwdGlv
bi4gIEkgaGF2ZSBwcm92aWRlZCBmdWxsIERveHlnZW4KPiA+ICAgY29tbWVudHMgZm9yICdzdHJ1
Y3QgcGFuZWxfZGVzYycgdG8gYWNjb21wbGlzaCB0aGF0Lgo+ID4gKiBwYW5lbF9zaW1wbGVfZ2V0
X2ZpeGVkX21vZGVzKCkgd2FzIHRob3VnaHQgdG8gYmUgYSBjb25mdXNpbmcgbmFtZSwKPiA+ICAg
c28gaXQgaGFzIGJlZW4gcmVuYW1lZCB0byBwYW5lbF9zaW1wbGVfZ2V0X2Rpc3BsYXlfbW9kZXMo
KS4KPiA+ICogcGFuZWxfc2ltcGxlX3BhcnNlX292ZXJyaWRlX21vZGUoKSB3YXMgdGhvdWdodCB0
byBiZSBiZXR0ZXIgbmFtZWQgYXMKPiA+ICAgcGFuZWxfc2ltcGxlX3BhcnNlX3BhbmVsX3RpbWlu
Z19ub2RlKCkuCj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgo+IAo+IFRoYW5rcy4KPiAKPiBJIHVwZGF0ZWQgdGhlICRzdWJqZWN0IHRvOgo+
ICAgICBkcm0vcGFuZWw6IHNpbXBsZTogZG9jdW1lbnQgcGFuZWxfZGVzYzsgcmVuYW1lIGEgZmV3
IGZ1bmN0aW9ucwo+IAo+IEFuZCBwdXNoZWQgb3V0IHRvIGRybS1taXNjLW5leHQuCgpJIHNlZSB0
aGUgZm9sbG93aW5nIGVycm9yIHByaW50ZWQgYXQgZWFjaCBib290OgoKICAgIC9wYW5lbDogY291
bGQgbm90IGZpbmQgbm9kZSAncGFuZWwtdGltaW5nJwoKVGhlIGVycm9yIG9yaWdpbmF0ZXMgZnJv
bSB0aGlzIHNuaXAgKGZyb20gcGFuZWwtc2ltcGxlLmMpOgoKICAgICAgIGlmICghb2ZfZ2V0X2Rp
c3BsYXlfdGltaW5nKGRldi0+b2Zfbm9kZSwgInBhbmVsLXRpbWluZyIsICZkdCkpCiAgICAgICAg
ICAgICAgICBwYW5lbF9zaW1wbGVfcGFyc2VfcGFuZWxfdGltaW5nX25vZGUoZGV2LCBwYW5lbCwg
JmR0KTsKCm9mX2dldF9kaXNwbGF5X3RpbWluZygpIHJldHVybnMgLTIgKC1FTk9FTlQpLgoKSW4g
dGhlIHNldHVwIEkgdXNlIHRoZXJlIGlzIG5vIHBhbmVsLXRpbWluZyBub2RlIGFzIHRoZSB0aW1p
bmcgc3BlY2lmaWVkCmluIHBhbmVsLXNpbXBsZS5jIGlzIGZpbmUuClRoaXMgaXMgdGhlIHR5cGlj
YWwgc2V0dXAgLSBhbmQgdGhlcmUgc2hvdWxkIG5vdCBpbiB0aGUgbm9ybWFsIGNhc2UKYmUgcHJp
bnRlZCBlcnJvciBtZXNzYWdlcyBsaWtlIHRoaXMgZHVyaW5nIGJvb3QuCgpXaWxsIHlvdSBwbGVh
c2UgdGFrZSBhIGxvb2sgYXQgdGhpcy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

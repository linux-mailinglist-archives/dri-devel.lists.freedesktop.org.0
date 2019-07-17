Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E87F6BD0E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8281C6E160;
	Wed, 17 Jul 2019 13:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C606E160
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 13:32:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1FE2620028;
 Wed, 17 Jul 2019 15:32:00 +0200 (CEST)
Date: Wed, 17 Jul 2019 15:31:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH 00/10] drm/tinydrm: Remove tinydrm.ko
Message-ID: <20190717133158.GA5121@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717115817.30110-1-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=gAmX6pxEAAAA:20
 a=7gkXJVJtAAAA:8 a=wgJAXNWQh66qfLkmp_MA:9 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTm9yYWxmLgoKTmljZSBzZXJpZXMgb2YgcGF0Y2hlcyEKCgoKT24gV2VkLCBKdWwgMTcsIDIw
MTkgYXQgMDE6NTg6MDdQTSArMDIwMCwgTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IFRoaXMgc2Vy
aWVzIHJlbW92ZXMgdGhlIHJlbWFpbmluZyBiaXRzIG9mIHRpbnlkcm0ua28uCj4gCj4gVGhlcmUn
cyBvbmx5IG9uZSBpdGVtIGxlZnQgb24gdGhlIHRpbnlkcm0gdG9kbyBsaXN0IGFuZCB0aGF0IGlz
IG1vdmluZwo+IG91dCBtaXBpX2RiaS4KPiAKPiBOb3RlOgo+IFRoaXMgZGVwZW5kcyBvbiBhIGNv
bW1pdCB0aGF0IGp1c3QgZW50ZXJlZCBMaW51cycgdHJlZToKPiBlNmYzZjdlNGRjNzYgKCJzcGk6
IEFkZCBzcGlfaXNfYnB3X3N1cHBvcnRlZCgpIikKPiAKPiBTZXJpZXMgaXMgYWxzbyBhdmFpbGFi
bGUgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vbGludXgvdHJlZS9yZW1vdmVfdGlu
eWRybV9rbwo+IAo+IE5vcmFsZi4KPiAKPiBOb3JhbGYgVHLDuG5uZXMgKDEwKToKPiAgIGRybTog
QWRkIFNQSSBjb25uZWN0b3IgdHlwZQo+ICAgZHJtL3Rpbnlkcm06IFVzZSBzcGlfaXNfYnB3X3N1
cHBvcnRlZCgpCj4gICBkcm0vdGlueWRybTogUmVtb3ZlIHNwaSBkZWJ1ZyBidWZmZXIgZHVtcGlu
Zwo+ICAgZHJtL3Rpbnlkcm06IFJlbW92ZSB0aW55ZHJtX3NwaV9tYXhfdHJhbnNmZXJfc2l6ZSgp
Cj4gICBkcm0vdGlueWRybTogQ2xlYW4gdXAgdGlueWRybV9zcGlfdHJhbnNmZXIoKQo+ICAgZHJt
L3Rpbnlkcm06IE1vdmUgdGlueWRybV9zcGlfdHJhbnNmZXIoKQo+ICAgZHJtL3Rpbnlkcm06IE1v
dmUgdGlueWRybV9tYWNoaW5lX2xpdHRsZV9lbmRpYW4oKQo+ICAgZHJtL3Rpbnlkcm0vcmVwYXBl
cjogRG9uJ3QgdXNlIHRpbnlkcm1fZGlzcGxheV9waXBlX2luaXQoKQo+ICAgZHJtL3Rpbnlkcm0v
bWlwaS1kYmk6IEFkZCBtaXBpX2RiaV9pbml0X3dpdGhfZm9ybWF0cygpCj4gICBkcm0vdGlueWRy
bTogTW92ZSB0aW55ZHJtX2Rpc3BsYXlfcGlwZV9pbml0KCkgdG8gbWlwaS1kYmkKPiAKClBhdGNo
IDEtMywgNywgOCwgOSBhcmU6ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9y
Zy5vcmc+CgpQYXRjaCA0IGFyZToKQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4KKERpZCBub3QgZmVlbCBJIGhhZCBlbm91Z2ggYmFja2dyb3VuZCB0byBzYXkgci1iKS4K
CkluZGl2aWR1YWwgY29tbWVudHMgc2VudCBmb3IgdGhlIG90aGVyIHBhdGNoZXMuCgoJU2FtCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

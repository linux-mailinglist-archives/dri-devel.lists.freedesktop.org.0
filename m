Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A846C070
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 19:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ED76E28C;
	Wed, 17 Jul 2019 17:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CFB6E28C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 17:33:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 106242002E;
 Wed, 17 Jul 2019 19:33:18 +0200 (CEST)
Date: Wed, 17 Jul 2019 19:33:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/panel: simple: Doxygenize 'struct panel_desc';
 rename a few functions
Message-ID: <20190717173317.GA4862@ravnborg.org>
References: <20190712163333.231884-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712163333.231884-1-dianders@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=cm27Pg_UAAAA:8 a=6j_ga0iaD_65Czu98M8A:9 a=CjuIK1q_8ugA:10
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

SGkgRG91Zy4KCk9uIEZyaSwgSnVsIDEyLCAyMDE5IGF0IDA5OjMzOjMzQU0gLTA3MDAsIERvdWds
YXMgQW5kZXJzb24gd3JvdGU6Cj4gVGhpcyBhdHRlbXB0cyB0byBhZGRyZXNzIG91dHN0YW5kaW5n
IHJldmlldyBmZWVkYmFjayBmcm9tIGNvbW1pdAo+IGI4YTI5NDhmYTJiMyAoImRybS9wYW5lbDog
c2ltcGxlOiBBZGQgYWJpbGl0eSB0byBvdmVycmlkZSB0eXBpY2FsCj4gdGltaW5nIikuICBTcGVj
aWZpY2FsbHk6Cj4gCj4gKiBJdCB3YXMgcmVxdWVzdGVkIHRoYXQgSSBkb2N1bWVudCAoaW4gdGhl
IHN0cnVjdHVyZSBkZWZpbml0aW9uKSB0aGF0Cj4gICB0aGUgZGV2aWNlIHRyZWUgb3ZlcnJpZGUg
aGFkIG5vIGVmZmVjdCBpZiAnc3RydWN0IGRybV9kaXNwbGF5X21vZGUnCj4gICB3YXMgdXNlZCBp
biB0aGUgcGFuZWwgZGVzY3JpcHRpb24uICBJIGhhdmUgcHJvdmlkZWQgZnVsbCBEb3h5Z2VuCj4g
ICBjb21tZW50cyBmb3IgJ3N0cnVjdCBwYW5lbF9kZXNjJyB0byBhY2NvbXBsaXNoIHRoYXQuCj4g
KiBwYW5lbF9zaW1wbGVfZ2V0X2ZpeGVkX21vZGVzKCkgd2FzIHRob3VnaHQgdG8gYmUgYSBjb25m
dXNpbmcgbmFtZSwKPiAgIHNvIGl0IGhhcyBiZWVuIHJlbmFtZWQgdG8gcGFuZWxfc2ltcGxlX2dl
dF9kaXNwbGF5X21vZGVzKCkuCj4gKiBwYW5lbF9zaW1wbGVfcGFyc2Vfb3ZlcnJpZGVfbW9kZSgp
IHdhcyB0aG91Z2h0IHRvIGJlIGJldHRlciBuYW1lZCBhcwo+ICAgcGFuZWxfc2ltcGxlX3BhcnNl
X3BhbmVsX3RpbWluZ19ub2RlKCkuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRl
cnNAY2hyb21pdW0ub3JnPgoKVGhhbmtzLgoKSSB1cGRhdGVkIHRoZSAkc3ViamVjdCB0bzoKICAg
IGRybS9wYW5lbDogc2ltcGxlOiBkb2N1bWVudCBwYW5lbF9kZXNjOyByZW5hbWUgYSBmZXcgZnVu
Y3Rpb25zCgpBbmQgcHVzaGVkIG91dCB0byBkcm0tbWlzYy1uZXh0LgoKPiAtIFNhbSBzYWlkIHRo
YXQgdGhlcmUgd2FzIHN0aWxsIHNvbWV0aGluZyB0aGF0IGhlIGRpZG4ndCB1bmRlcnN0YW5kCj4g
ICB3aXRoIHJlZ2FyZHMgdG8gdGhlIGZsYWdzLiAgU2FtOiBpZiB0aGlzIGlzIHNvbWV0aGluZyB0
aGF0IG5lZWRzIHRvCj4gICBiZSBhZGRyZXNzZWQsIHBsZWFzZSB5ZWxsLgoKTmVlZCB0byByZS12
aXNpdCB0aGlzIGxhdGVyIHdoZW4gSSBoYXZlIGZhbWlsaWFyaXplZCBteXNlbGYgd2l0aAp0aGUg
bmV3IHlhbWwgc3ludGF4IGFuZCB3aGF0IGltcGFjdCBhbnkgcG90ZW50aWFsIGNoYW5nZXMgbWF5
IGhhdmUgb24KdGhlIHBhbmVsIGRyaXZlcnMuClNvIGZvciBub3cgd2UgbGVhdmUgaXQgYXMgaXMu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

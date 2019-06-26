Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C756BEE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 16:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8116E44B;
	Wed, 26 Jun 2019 14:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1049F6E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 14:29:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 48BE420054;
 Wed, 26 Jun 2019 16:29:32 +0200 (CEST)
Date: Wed, 26 Jun 2019 16:29:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] [v8, 1/2] dt-bindings: panel: Add Boe Himax8279d is
 1200x1920, 4-lane MIPI-DSI LCD panel
Message-ID: <20190626142930.GA12268@ravnborg.org>
References: <20190425031842.17202-1-jerry.han.hq@gmail.com>
 <20190626125507.GC23428@ravnborg.org>
 <CACvgo50Rm_OLXDMjw32p=yxm24Xu+TG6YYK78PczrHWRqGkVLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo50Rm_OLXDMjw32p=yxm24Xu+TG6YYK78PczrHWRqGkVLg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=GUEECZ4OhC9YS50kHiQA:9 a=CjuIK1q_8ugA:10
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Rock wang <rock_wang@himax.com.cn>, Jerry Han <jerry.han.hq@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRW1pbC4KCj4gPgo+ID4gVGhhbmtzLAo+ID4gcGF0Y2ggYXBwbGllZCB0byBkcm0tbWlzYy1u
ZXh0IGFuZCB3aWxsIGJlIHB1c2hlZCBvdXQgc29vbi4KPiA+Cj4gSXNuJ3QgYW4gYWNrL3JiIGZy
b20gYSBEVCBtYWludGFpbmVyIGEgcmVxdWlyZW1lbnQgYmVmb3JlIGJlaW5nIHBpY2tlZAo+IHZp
YSB0aGUgRFJNIHRyZWVzPwo+IEl0IHVzZWQgdG8gYmUgYSB0aGluZywgYWx0aG91Z2ggaXQgY291
bGQgaGF2ZSBjaGFuZ2VkIHJlY2VudGx5LgpJIGdvdCBPSyB2aWEgaXJjIHRvIHRha2Ugc29tZSBz
aW1wbGUgcGFuZWwgYmluZGluZ3MgcGF0Y2hlcy4KV2hpY2ggZXhwbGFpbnMgdGhlIGxhY2sgb2Yg
YS1iIG9yIHItYiBvbiB0aGlzIHBhdGNoIGZyb20gYW55IERUIGZvbGtzLgoKU28gSSBwcm9jZXNz
ZWQgd2hhdCB3YXMgaW4gcXVldWUuCk1heWJlIHRoZSBPSyB3YXMgb25seSBmb3IgYSBzbWFsbGVy
IHNldCBvZiBwYXRjaGVzIGJ1dCBJIGRpZCBwcm9jZXNzCm9ubHkgcGFuZWwtYmluZGluZ3MgdGhh
dCBJIHdhcyByZWFkeSB0byBhZGQgbXkgci1iIG9uLgoKPiAKPiBBRkFJQ1QgdGhlcmUgYXJlIG5v
IHVzZXJzIGZvciB0aGlzIGJpbmRpbmcsIHlldCBJJ20gbm90IHN1cmUgaWYgdGhhdAo+IGlzIGEg
cmVxdWlyZW1lbnQuClRvIG15IGJlc3Qga25vd2xlZGdlIGEga2VybmVsIHVzZXIgaXMgbm90IGEg
cmVxdWlyZW1lbnQuCkluIHRoaXMgY2FzZSB0aGVyZSBpcyBhIHBhdGNoIGluLXRoZS13b3JrcyBh
bmQgSSBjb25zaWRlcmVkIHRvCndhaXQgdW50aWwgdGhlIHBhdGNoIHdhcyByZWFkeS4gQnV0IGRl
Y2lkZWQgdG8gcHJvY2VzcyB0aGUgRFQtYmluZGluZwphcyB0aGUgYmluZGluZyBpcyBhIHByZXJl
cXVpc2l0ZSBmb3IgdGhlIHBhbmVsIGRyaXZlciwKYnV0IG5vdCB0aGUgb3RoZXIgd2F5IGFyb3Vu
ZC4gQWdhaW4gdG8gbXkgdW5kZXJzdGFuZGluZy4KClNvIGV2ZXJ5dGhpbmcgd2FzIGRvbmUgdG8g
YXZvaWQgaGF2aW5nIHBhbmVsIHBhdGNoZXMgaGFuZ2luZyBpbgpkcmktZGV2ZWwgZm9yIGV4Y2Vz
c2l2ZSBhbW91bnQgb2YgdGltZS4KT25lIGNvdWxkIHNheSB0aGF0IHRoaXMgd2FzIGFscmVhZHkg
dGhlIGNhc2UgdGhhdCB0aGV5IGhhZCB3YWl0ZWQgZm9yCnRvbyBsb25nLgoKQW5vdGhlciAtIG5v
dCBzbyBvYnZpb3VzIHRoaW5nIC4gd2FzIHRoYXQgaGF2aW5nIGFsbCBwYXRjaGVzIGluCmRybS1t
aXNjLW5leHQgYWxsb3dzIHVzIHRvIGhhdmUgYW4gZWFzaWVyIHRpbWUgbWlncmF0aW5nIGFsbCBw
YW5lbApwYXRjaGVzIHRvIHlhbWwgd2hpY2ggSSBob3BlIHdpbGwgdGFrZSBwbGFjZSBpbiB0aGUg
bmV4dCBtb250aCBvciB0d28uCkkgYW0gd2FpdGluZyBmb3IgdGhlIGluaXRhbCBwYXRjaC1zZXQg
YnkgUm9iIHRvIGxhbmQsIGFuZCB0aGVuIHRoZXJlCmlzIHNvbWUgamFuaXRvcmlhbCBqb2IgdG8g
bWlncmF0ZSByZW1haW5pZ24gcGFuZWwgYmluZGluZ3MgdG8geWFtbC4KVGhpcyBpcyBlYXNpZXIg
dG8gZG8gd2l0aCBldmVyeXRpbmcgaW4gZHJtLW1pc2MtbmV4dCByYXRoZXIgdGhhbiBhc2tpbmcK
c2V2ZXJhbCBkaWZmZXJlbnQgcGVyc29ucyB0byBkbyBpdC4KT25jZSBkb25lIHRoZXJlIHdpbGwg
YmUgbG90IG9mIGV4YW1wbGVzIHRvIHdvcmsgZnJvbSwgc28gZm9yIG5ldyBwYW5lbApiaW5kaW5n
cyBpdCBzaG91bGQgYmUgZWFzaWVyLgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F10AB62B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 12:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6856E23D;
	Fri,  6 Sep 2019 10:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5D6E23D
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 10:40:37 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1i6BfQ-000494-ET; Fri, 06 Sep 2019 12:40:36 +0200
Message-ID: <ca19b57631d8e8b97f1f81b6383954c1cbf9f7c1.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/etnaviv: update hardware headers from rnndb
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Fri, 06 Sep 2019 12:40:36 +0200
In-Reply-To: <CAH9NwWc1BmQabXfJQ1HFS7xOew2TtDBDDRzWcP_UUSuZ7OqDDQ@mail.gmail.com>
References: <20190906100308.15341-1-christian.gmeiner@gmail.com>
 <ed249ddd9a37878214047fad227b7bf460da3298.camel@pengutronix.de>
 <CAH9NwWc1BmQabXfJQ1HFS7xOew2TtDBDDRzWcP_UUSuZ7OqDDQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnIsIDIwMTktMDktMDYgYXQgMTI6MzUgKzAyMDAsIENocmlzdGlhbiBHbWVpbmVyIHdyb3Rl
Ogo+IEFtIEZyLiwgNi4gU2VwdC4gMjAxOSB1bSAxMjoxMSBVaHIgc2NocmllYiBMdWNhcyBTdGFj
aCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT46Cj4gPiBPbiBGciwgMjAxOS0wOS0wNiBhdCAxMjow
MyArMDIwMCwgQ2hyaXN0aWFuIEdtZWluZXIgd3JvdGU6Cj4gPiA+IFVwZGF0ZSB0aGUgc3RhdGUg
SEkgYW5kIGNvbW1vbiBoZWFkZXIgZnJvbSBybm5kYiBjb21taXQKPiA+ID4gYTA0MjgzNTkxYThh
IChybm5kYjogdXBkYXRlIE1NVSBleGNlcHRpb24gY2F1c2VzKS4KPiA+ID4gCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBHbWVpbmVyIDxjaHJpc3RpYW4uZ21laW5lckBnbWFpbC5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvc3RhdGUueG1sLmggICAg
IHwgICAzNyArLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvc3RhdGVfM2QueG1sLmgg
IHwgMTg0OSArKysrKysrKysrKysrKysrKysrKysrLQo+ID4gCj4gPiBJJ20gbm90IGEgZmFuIG9m
IHB1bGxpbmcgaW4gdGhlIGNvbXBsZXRlIHN0YXRlXzNkIGhlYWRlci4gT25seSBhIHZlcnkKPiA+
IGxpbWl0ZWQgc3Vic2V0IG9mIHRob3NlIHN0YXRlcyBhcmUgdXNlZCBpbiB0aGUga2VybmVsIGFu
ZCB0aGUgcmVzdCBvZgo+ID4gdGhpcyBtYXNzaXZlIHN0YXRlIHNldCBpcyBwdXJlIG5vaXNlIGZy
b20gYSBrZXJuZWwgUG9WLgo+ID4gCj4gCj4gV2hhdCBpZiBJIGp1c3QgdXBkYXRlIHN0YXRlX2hp
LnhtbC5oIGFuZCBsZWF2ZSB0aGUgb3RoZXJzIHVudG91Y2hlZD8KPiBXb3VsZCB0aGF0IHdvcmsg
Zm9yIHlvdT8KCkkgZG9uJ3QgcmVhbGx5IGNhcmUgYWJvdXQgdGhlIG90aGVyIEhXIGhlYWRlcnMs
IGFzIHRoZSBzaWduYWwvbm9pc2UKcmF0aW8gaXMgZ2VuZXJhbGx5IG11Y2ggYmV0dGVyIHRoYW4g
dGhlIDNEIHN0YXRlcy4KClNvIGJvdGggdXBkYXRpbmcgYWxsIGhlYWRlciBleGNlcHQgdGhlIHN0
YXRlXzNkIG9yIGp1c3QgdXBkYXRpbmcKc3RhdGVfaGkgd29ya3MgZm9yIG1lLiBUaGF0J3MgdXAg
dG8geW91ciBwcmVmZXJlbmNlLiA6KSBJIGp1c3Qgd2FudCB0bwphdm9pZCBwdWxsaW5nIGluIGFs
bCB0aGUgc3RhdGVfM2Qgbm9pc2UuCgpSZWdhcmRzLApMdWNhcwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

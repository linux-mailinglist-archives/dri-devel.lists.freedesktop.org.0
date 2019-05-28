Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00F2CC35
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671DE6E25A;
	Tue, 28 May 2019 16:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0FE6E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 16:37:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C48D4803EF;
 Tue, 28 May 2019 18:37:36 +0200 (CEST)
Date: Tue, 28 May 2019 18:37:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190528163730.GA9610@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=xIEnxEUKAAAA:8 a=r9HNN9kqRSi6j70AMfAA:9 a=CjuIK1q_8ugA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=JpDqF-G6Ufas406PgLIE:22
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KClJlYWRpbmcgdGhyb3VnaCB0aGlzIG5pY2Ugc2VyaWVzLgoKT24gVHVlLCBN
YXkgMjgsIDIwMTkgYXQgMDU6MTI6MjhQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToK
PiBBZGQgYSBuZXcgb3B0aW9uYWwgcmVuZXNhcyxjb21wYW5pb24gcHJvcGVydHkgdG8gcG9pbnQg
dG8gdGhlIGNvbXBhbmlvbgo+IExWRFMgZW5jb2Rlci4gVGhpcyBpcyB1c2VkIHRvIHN1cHBvcnQg
ZHVhbC1saW5rIG9wZXJhdGlvbiB3aGVyZSB0aGUgbWFpbgo+IExWRFMgZW5jb2RlciBzcGxpdHMg
ZXZlbi1udW1iZXJlZCBhbmQgb2RkLW51bWJlcmVkIHBpeGVscyBiZXR3ZWVuIHRoZQo+IHR3byBM
VkRTIGVuY29kZXJzLgo+IAo+IFRoZSBuZXcgcHJvcGVydHkgZG9lc24ndCBjb250cm9sIHRoZSBt
b2RlIG9mIG9wZXJhdGlvbiwgaXQgb25seQo+IGRlc2NyaWJlcyB0aGUgcmVsYXRpb25zaGlwIGJl
dHdlZW4gdGhlIG1hc3RlciBhbmQgY29tcGFuaW9uIExWRFMKPiBlbmNvZGVycy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRl
YXNvbmJvYXJkLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRp
Lm9yZz4KPiBUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9y
Zz4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IAo+IC0gQ2xhcmlmeSB3aGVuIHRoZSBjb21w
YW5pb24gcHJvcGVydHkgaXMgcmVxdWlyZWQgb3Igbm90IGFsbG93ZWQKPiAKPiBDaGFuZ2VzIHNp
bmNlIHYxOgo+IAo+IC0gRml4ZWQgdHlwbwo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0ICAgIHwgNyArKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxs
dmRzLnR4dAo+IGluZGV4IDkwMGE4ODRhZDlmNS4uMmQyNGJkOGNiZWM1IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2Fz
LGx2ZHMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL3JlbmVzYXMsbHZkcy50eHQKPiBAQCAtNDUsNiArNDUsMTMgQEAgT0YgZ3JhcGgg
YmluZGluZ3Mgc3BlY2lmaWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9n
cmFwaC50eHQuCj4gIAo+ICBFYWNoIHBvcnQgc2hhbGwgaGF2ZSBhIHNpbmdsZSBlbmRwb2ludC4K
PiAgCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKwo+ICstIHJlbmVzYXMsY29tcGFuaW9uIDog
cGhhbmRsZSB0byB0aGUgY29tcGFuaW9uIExWRFMgZW5jb2Rlci4gVGhpcyBwcm9wZXJ0eSBpcwo+
ICsgIG1hbmRhdG9yeSBmb3IgdGhlIGZpcnN0IExWRFMgZW5jb2RlciBvbiBEMyBhbmQgRTMgU29D
cywgYW5kIHNoYWxsIHBvaW50IHRvCj4gKyAgdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQg
YXMgYSBjb21wYW5pb24gaW4gZHVhbC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdAo+ICsgIGJlIHNl
dCBmb3IgYW55IG90aGVyIExWRFMgZW5jb2Rlci4KCklmIHRoZSBEMyBhbmQgRTMgc29jcyBkbyBu
b3QgbWFuZGF0ZSB0aGUgdXNlIG9mIGR1YWwtbGluaywgdGhlbiB3aGF0IHRvCmRvIGluIHRoZSBE
VD8gQmVjYXVzZSBhY2NvcmRpbmcgdG8gdGhlIGFib3ZlIHRoaXMgcHJvcGVydHkgbXVzdCBiZQpz
cGVjaWZpZWQgZm9yIEQzIGFuZCBFMyBTT0Mncy4KCj4gKwo+ICAKPiAgRXhhbXBsZToKCkFsd2F5
cyBnb29kIHdpdGggZXhhbXBsZXMsIG1heWJlIGl0IGNvbWVzIGxhdGVyLgoKCVNhbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

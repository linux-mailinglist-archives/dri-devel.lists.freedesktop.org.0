Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E4EDCE5A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188A6EBB2;
	Fri, 18 Oct 2019 18:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFE16EA9F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 13:28:50 +0000 (UTC)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iL5pf-0000Od-1U; Thu, 17 Oct 2019 15:28:47 +0200
Date: Thu, 17 Oct 2019 15:28:47 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191017132846.ojsh27celyl76dlx@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
 <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
 <20191017132324.GP4365@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017132324.GP4365@dell>
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0xNyAxNDoyMzoyNCBbKzAxMDBdLCBMZWUgSm9uZXMgd3JvdGU6Cj4gU28gd2hh
dCBhcmUgdGhlIE9QJ3MgZXhwZWN0YXRpb25zIGluIHRoYXQgcmVnYXJkPyAgSSBzZWUgdGhpcyBp
cyBhCj4gbGFyZ2Ugc2V0IGFuZCBJIGFtIG9ubHkgcHJpdnkgdG8gdGhpcyBwYXRjaCwgdGh1cyBs
YWNrIHdpZGVyCj4gdmlzaWJpbGl0eS4gIERvZXMgdGhpcyBwYXRjaCBkZXBlbmQgb24gb3RoZXJz
LCBvciBpcyBpdCBpbmRlcGVuZGVudD8KPiBJJ20gaGFwcHkgdG8gdGFrZSBpdCwgYnV0IHdpc2gg
dG8gYXZvaWQgYmlzZWN0YWJpbGl0eSBpc3N1ZXMgaW4gdGhlCj4gbmV4dCByZWxlYXNlIGtlcm5l
bC4KCkl0IGlzIGluZGVwZW5kZW50LCB5b3UgY2FuIGFwcGx5IGl0IHRvIHlvdXIgLW5leHQgYnJh
bmNoLiBBbGwKZGVwZW5kZW5jaWVzIGFyZSBtZXJnZWQuCgpTZWJhc3RpYW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

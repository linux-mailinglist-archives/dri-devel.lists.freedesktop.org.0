Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5787784C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jul 2019 12:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202926EE9E;
	Sat, 27 Jul 2019 10:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562806EE9C
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2019 10:50:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9ACD3803F0;
 Sat, 27 Jul 2019 12:50:35 +0200 (CEST)
Date: Sat, 27 Jul 2019 12:50:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: My penguin has blue feets (aka: RGB versus BGR troubles)
Message-ID: <20190727105034.GA28526@ravnborg.org>
References: <20190726203626.GA31474@ravnborg.org>
 <CAKb7UvinPymcodpDuu8DX=L2bo4eY7ML1uKdh6no7byLLiurOg@mail.gmail.com>
 <CAKMK7uEVaFeWwGQcvkZ9m2Q0DKzKmKTgkfmVZoKgt9iTR3dOMQ@mail.gmail.com>
 <20190727101218.GB25081@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190727101218.GB25081@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=cpu6hrmyqh_P22PSb4kA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCj4gIyBtb2RldGVzdCAtTSBhdG1lbC1sY2RjIC1hIC1zIC4uLgo+IAo+IGRvZXMgbm90IHdv
cmsgYnR3LiBJdCBqdXN0IGV4aXN0cyB3aXRob3V0IGFueXRoaW5nIHNob3duIG9uIHRoZSBwYW5l
bC4KCkxvb2tpbmcgYXQgdGhlIG1vZGV0ZXN0IHNyYyAtYSByZXF1aXJlcyBib3RoIGEgcHJpbWFy
eSBwbGFuZSArIGFuIG92ZXJsYXkuCklmIGVpdGhlciBpcyBtaXNzaW5nIG1vZGV0ZXN0IGp1c3Qg
ZXhpc3RzIHdpdGggbm8gZXJyb3JzIHByaW50ZWQuCkFub3RoZXIgb3Bwb3J0dW5pdHkgdG8gaW1w
cm92ZSBlcnJvciBoYW5kbGluZy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

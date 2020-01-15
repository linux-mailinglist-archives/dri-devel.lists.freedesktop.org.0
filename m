Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F2A13C0F7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 13:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207AD6E95B;
	Wed, 15 Jan 2020 12:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A156E95B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:29:26 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2960F20372;
 Wed, 15 Jan 2020 13:29:24 +0100 (CET)
Date: Wed, 15 Jan 2020 13:29:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v6 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20200115122922.GA18982@ravnborg.org>
References: <cover.1579086894.git.jsarha@ti.com>
 <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66c57bb30685920f040933ada9ccd4f5035d099f.1579086894.git.jsarha@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10
 a=6AkCbFbQfmYoq7yG4RYA:9 a=QEXdDO2ut3YA:10
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
Cc: devicetree@vger.kernel.org, yamonkar@cadence.com, praneeth@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com, maxime@cerno.tech
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaS4KCj4gCj4gdjY6IC0gQ2hlY2sgQ1RNIGFuZCBnYW1tYSBzdXBwb3J0IGZyb20gZGlz
cGNfZmVhdHVyZXMgd2hlbiBjcmVhdGluZyBjcnRjCj4gICAgIC0gSW1wbGVtZW50IENUTSBzdXBw
b3J0IGZvciBrMmcgYW5kIGZpeCBrMyBDVE0gaW1wbGVtZW50YXRpb24KPiAgICAgLSBSZW1vdmUg
Z2FtbWEgcHJvcGVydHkgcGVyc2lzdGVuY2UgYW5kIGFsd2F5cyB3cml0ZSBjb2xvciBwcm9wZXJ0
aWVzCj4gICAgICAgaW4gYSBuZXcgbW9kZXNldAoKSSBnZXQgdGhpcyBlcnJvciB3aGVuIEkgYnVp
bGQgdGhpcyBwYXRjaCBvbiB0b3Agb2YgZHJtLW1pc2MtbmV4dDoKCmRyaXZlcnMvZ3B1L2RybS90
aWRzcy90aWRzc19lbmNvZGVyLmM6IEluIGZ1bmN0aW9uIOKAmHRpZHNzX2VuY29kZXJfYXRvbWlj
X2NoZWNr4oCZOgpkcml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZW5jb2Rlci5jOjM1OjIzOiBl
cnJvcjog4oCYc3RydWN0IGRybV9lbmNvZGVy4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYYnJp
ZGdl4oCZCiAgIDM1IHwgIGZvciAoYnJpZGdlID0gZW5jb2Rlci0+YnJpZGdlOyBicmlkZ2U7IGJy
aWRnZSA9IGJyaWRnZS0+bmV4dCkgewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefgpk
cml2ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfZW5jb2Rlci5jOjM1OjU2OiBlcnJvcjog4oCYc3Ry
dWN0IGRybV9icmlkZ2XigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhuZXh04oCZCiAgIDM1IHwg
IGZvciAoYnJpZGdlID0gZW5jb2Rlci0+YnJpZGdlOyBicmlkZ2U7IGJyaWRnZSA9IGJyaWRnZS0+
bmV4dCkgewogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBefgoKSSBkaWQgbm90IGludmVzdGlnYXRlIC0gYnV0IGl0IGxvb2tzIGxp
a2UgdGhlIHBhdGNoIG5lZWRzCnRvIGJlIGFkYXB0ZWQgdG8gbGF0ZXN0IGRybS1taXNjLW5leHQg
Y2hhbmdlcy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

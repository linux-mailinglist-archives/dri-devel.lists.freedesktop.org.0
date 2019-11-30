Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D4210DE87
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2019 19:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204786E15B;
	Sat, 30 Nov 2019 18:30:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426E06E15B
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2019 18:30:39 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A39A48062D;
 Sat, 30 Nov 2019 19:30:34 +0100 (CET)
Date: Sat, 30 Nov 2019 19:30:33 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH 4/5] drm/tidss: New driver for TI Keystone platform
 Display SubSystem
Message-ID: <20191130183033.GA24722@ravnborg.org>
References: <cover.1574760777.git.jsarha@ti.com>
 <22b946bd3ad7617f44b3705f785adb21c8593c80.1574760777.git.jsarha@ti.com>
 <20191126212634.GA3807@ravnborg.org>
 <66b7051a-5e16-e81c-cf78-4b99a802fd1b@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66b7051a-5e16-e81c-cf78-4b99a802fd1b@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=szbOtlZEDUcR4rWv6bIA:9 a=CjuIK1q_8ugA:10
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
Cc: yamonkar@cadence.com, praneeth@ti.com, subhajit_paul@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSnlyaQoKPiBJIGFtIG5vdCBzbyBzdXJlIGlmIHRoZSBEU1MgZ28tYml0IGZ1bmN0aW9uYWxp
dHkgKGh3IHN1cHBvcnQgdG8gY29tbWl0Cj4gY2hhbmdlcyB0byBkaXNwbGF5IGR1cmluZyBuZXh0
IHZlcnRpY2FsIGJsYW5rKSBzbyB3aWRlbHkgdXNlZCBjb25jZXB0Cj4gdGhhdCBpdCB3b3VsZCBt
YWtlIHNlbnNlIHRvIG1ha2UgZHJtIHdpZGUgaGVscGVycyB0byBoYW5kbGUgaXQuCgpUaGUgcXVl
c3Rpb24gd2FzIHRoZSBvdGhlciB3YXkgYXJvdW5kLgpJIHdhcyBqdXN0IHdvbmRlcmluZyBpZiB0
aGVyZSBpcyBzb21lIG9mIHRoZSBwcmVzZW50IGhlbHBlcnMKdGhhdCB0aGUgZHJpdmVyIGNhbiBi
ZW5lZml0IGZyb20uCkl0IGlzIG5vdCB0aGF0IEkgZm91bmQgc29tZXRoaW5nIC0gaXQgd2FzIGp1
c3QgYSBkcml2ZS1ieSBjb21tZW50LgoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=

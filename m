Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252F77141A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 10:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC8D6E29A;
	Tue, 23 Jul 2019 08:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BB66E29A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 08:40:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1E03B80480;
 Tue, 23 Jul 2019 10:40:34 +0200 (CEST)
Date: Tue, 23 Jul 2019 10:40:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] Fixes for mgag200 cursors
Message-ID: <20190723084033.GB32268@ravnborg.org>
References: <20190723075425.24028-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723075425.24028-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=0dOf01WEFSyWK1-qjoAA:9 a=EylzK5yTkgqw2psV:21 a=Q0sMe_5qjCq_WXDa:21
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKT24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDk6NTQ6MjJBTSArMDIwMCwgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gVGhpcyBwYXRjaCBzZXQgZml4ZXMgYSBudW1iZXIgb2Yg
YnVncyB0aGF0IHdoZXJlIGludHJvZHVjZWQgYnkgdGhlCj4gcmVjZW50IGNoYW5nZXMgdG8gbWdh
ZzIwMCdzIGhhbmRsaW5nIG9mIGN1cnNvciBCT3MuCj4gCj4gVGhvbWFzIFppbW1lcm1hbm4gKDMp
Ogo+ICAgZHJtL21nYWcyMDA6IFBpbiBkaXNwbGF5ZWQgY3Vyc29yIEJPIHRvIHZpZGVvIG1lbW9y
eQo+ICAgZHJtL21nYWcyMDA6IFNldCBjdXJzb3Igc2Nhbm91dCBhZGRyZXNzIHRvIGNvcnJlY3Qg
Qk8KPiAgIGRybS9tZ2FnMjAwOiBEb24ndCB1bnBpbiB0aGUgY3VycmVudCBjdXJzb3IgaW1hZ2Un
cyBidWZmZXIuCgpCcm93c2VkIHRoZSBmaXhlcyAtIGxvb2tzIGdvb2QgdG8gbWUuCgpBY2tlZC1i
eTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

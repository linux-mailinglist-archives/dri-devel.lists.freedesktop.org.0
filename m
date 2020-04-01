Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61419B6CA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 22:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C306E0EC;
	Wed,  1 Apr 2020 20:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ED86E037;
 Wed,  1 Apr 2020 20:17:30 +0000 (UTC)
Date: Wed, 01 Apr 2020 20:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1585772247;
 bh=tUj3hEivSyLz1zZXoMc/VKk3sDaNXry16h53d6aThXA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=a9aiI84yDi3L3rH3NHSjDH3nRMXBwUUmy4qO3vcjTWYFb898qAYJkDdK5oT5bg4+/
 98A9ZC84SqBRuqMQK5k9OIDh5s5d7SBmNrx/u+Vd2/rIn6Y4Ddq+8GNNg6IoYXNVeR
 yZFOqcR2CwvgFkkFFGL7Iht/22xxYvBdxD1NouXM=
To: Matt Hoosier <matt.hoosier@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: Aliases for DRI connectors?
Message-ID: <qeN5Zly4y6dDc3LU25krLgbaUgERWRs8Rz-ZZzgLctPbV2zEpZZq1JHpt6WKJeCrcGUaouhXMcau7qvgGNx4cfStu9wil6ZIcu0DQGVADlk=@emersion.fr>
In-Reply-To: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
References: <CAJgxT3-11eZqvysgCQMCYtKEUVsNWWHd+7au91uNC7SWK1Fyug@mail.gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland mailing list <wayland-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkbmVzZGF5LCBBcHJpbCAxLCAyMDIwIDk6MzggUE0sIE1hdHQgSG9vc2llciA8bWF0dC5o
b29zaWVyQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEknbSBzZWFyY2hpbmcgZm9yIHNvbWUgc29ydCBv
ZiBzY2hlbWUgdGhhdCB3aWxsIGxldCBteSBEUkkgbWFzdGVyIHF1ZXJ5IHRoZSBzZXQgb2YgYXZh
aWxhYmxlIGNvbm5lY3RvcnPCoGFuZCBzZWxlY3QgdGhlIG9uZSBjYXJyeWluZyBhIHByZWFycmFu
Z2VkIGRlc2lnbmF0aW9uLiBUaGUgcHJvYmxlbSBJJ20gdHJ5aW5nIHRvIHNvbHZlIGlzIHRvIGFs
bG93IGRlcGxveWluZyBvbmUgc3RhbmRhcmRpemVkIHVzZXJzcGFjZSBjb21wb25lbnQgYWNyb3Nz
IGEgZmxlZXQgb2YgZGV2aWNlcyB0aGF0IGhhdmUgdmFyeWluZyBudW1iZXJzIG9mIGRpc3BsYXlz
LCB3aXRoIHRoZSB1c2UgY2FzZXMgbm90IGFsd2F5cyBkcml2ZW4gb24gdGhlIHNhbWUgY29ubmVj
dG9yIHRvcG9sb2dpY2FsbHkuCj4KPiBJIGhhZCBhIGxvb2sgYXJvdW5kIHRoZSBwcm9wZXJ0aWVz
IGF2YWlsYWJsZcKgb24gbXkgc3lzdGVtJ3MgRFJJIGNvbm5lY3RvcnMsIGFuZCBub3RoaW5nIGlt
bWVkaWF0ZSBqdW1wZWQgb3V0IGF0IG1lLiBJcyB0aGVyZSBhIHN0YW5kYXJkIGNvbm5lY3RvciBw
cm9wZXJ0eSB0aGF0IChhc3N1bWluZyBJIGNhbiBmaW5kIHRoZSByaWdodCBwbGFjZSBpbiBEZXZp
Y2VUcmVlIG9yIHNpbWlsYXIgdG8pIHRoYXQgd291bGQgYmUgYSBnb29kIGZpdCBmb3IgdGhpcz8K
Ck1heWJlIGluZm9ybWF0aW9uIGluIHRoZSBFRElEIHdvdWxkIGhlbHA/IFlvdSdsbCBmaW5kIHRo
ZSBtYW51ZmFjdHVyZXIsCnRoZSBtb2RlbCBudW1iZXIgYW5kIHRoZSBzZXJpYWwgbnVtYmVyLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091810FD70
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:13:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB91F6E0A2;
	Tue,  3 Dec 2019 12:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3B6E0A2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 12:13:25 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 18175200EC;
 Tue,  3 Dec 2019 13:13:20 +0100 (CET)
Date: Tue, 3 Dec 2019 13:13:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/12] Clean up drm_pci.{c,h}
Message-ID: <20191203121319.GA31692@ravnborg.org>
References: <20191203100406.9674-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203100406.9674-1-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=VRoFN2UDnid1Ro7HGEQA:9 a=CjuIK1q_8ugA:10
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 alexander.deucher@amd.com, emil.velikov@collabora.com,
 christian.koenig@amd.com, dan.carpenter@oracle.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLgoKPiBUaGUgcmVzdAo+IG9mIHRoZSBwYXRjaGVzIHJlcGxhY2UgdW5uZWNlc3Nh
cnkgaW5jbHVkZSBzdGF0ZW1lbnRzIGZvciBkcm1fcGNpLmguIE1vc3QKPiBvZiB0aGUgc291cmNl
IGZpbGVzIG9ubHkgcmVxdWlyZSA8bGludXgvcGNpLmg+LgoKSSBndWVzcyBJIGFtIHRvIGJsYW1l
IGhlcmUuIFdoZW4gbWlncmF0aW5nIGF3YXkgZnJvbSBkcm1QLmggSSB1c2VkCjxkcm0vZHJtX3Bj
aS5oPiBhcyBwcmVmZXJyZWQgd2F5IHdoZW4gdGhlcmUgd2VyZSBwY2kgcmVsYXRlZCBidWlsZApl
cnJvcnMgYW5kIHdoZW4gaXQgd29ya2VkIEkgbW92ZWQgb24uClNvcnJ5IGZvciBjcmVhdGluZyBl
eHRyYSB3b3JrIGZvciB5b3UsIGJ1dCBnbGFkIHRvIHNlZSBpdCBjbGVhbmVkIHVwLgoKCVNhbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

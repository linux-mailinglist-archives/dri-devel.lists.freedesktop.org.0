Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6347E7FE8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 06:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046306E09A;
	Tue, 29 Oct 2019 05:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 630 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2019 05:53:21 UTC
Received: from smtp3-1.goneo.de (smtp3-1.goneo.de [85.220.129.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682D66E090;
 Tue, 29 Oct 2019 05:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.goneo.de (Postfix) with ESMTP id 1EC9B24007F;
 Tue, 29 Oct 2019 06:42:49 +0100 (CET)
X-Virus-Scanned: by goneo
X-Spam-Flag: NO
X-Spam-Score: -2.747
X-Spam-Level: 
X-Spam-Status: No, score=-2.747 tagged_above=-999 tests=[ALL_TRUSTED=-1,
 AWL=0.153, BAYES_00=-1.9] autolearn=ham
Received: from smtp3.goneo.de ([127.0.0.1])
 by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZjqyjNzm7GN; Tue, 29 Oct 2019 06:42:47 +0100 (CET)
Received: from [192.168.1.103] (dyndsl-037-138-239-146.ewe-ip-backbone.de
 [37.138.239.146])
 by smtp3.goneo.de (Postfix) with ESMTPSA id 024AA23F854;
 Tue, 29 Oct 2019 06:42:46 +0100 (CET)
Subject: Re: [PATCH v2] kernel-doc: rename the kernel-doc directive
 'functions' to 'identifiers'
To: Changbin Du <changbin.du@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20191020131717.28990-1-changbin.du@gmail.com>
 <20191024121940.1d6a64df@lwn.net> <87woctb9cj.fsf@intel.com>
 <20191025144802.uixg2crhw6h7gghq@mail.google.com> <87v9s99q9l.fsf@intel.com>
 <20191029003120.llve32crfw63ovpw@mail.google.com>
From: Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <36c4dcfb-5425-b4bc-a5e9-4fd1458c8385@darmarit.de>
Date: Tue, 29 Oct 2019 06:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029003120.llve32crfw63ovpw@mail.google.com>
Content-Language: de-DE
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
Cc: linux-usb@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-crypto@vger.kernel.org,
 linux-kselftest@vger.kernel.org, intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMTAuMTkgdW0gMDE6MzEgc2NocmllYiBDaGFuZ2JpbiBEdToKPj4gQnV0IGlzIGl0LCBy
ZWFsbHk/IEkgYWdyZWUgd2l0aCBKb24gYWJvdXQgdGhlIGRpc3RpbmN0aW9uIGJldHdlZW4gTm9u
ZQo+PiBhbmQgJycgYmVpbmcgY29uZnVzaW5nLgo+Pgo+IEhlcmUgcHl0aG9uIGlzIGRpZmZlcmVu
dCBmcm9tIEMuIEJvdGggZW1wdHkgc3RyaW5nIGFuZCBOb25lIGFyZSBGYWxzZSBpbiBweXRob24u
Cj4gTm90ZSBzdWNoIGNvbmRpdGlvbiBpcyBjb21tb24gaW4gcHl0aG9uLgoKVGhlIG9uZSBpcyBh
IGVtcHR5IHN0cmluZyBzdHIoJycpLCBpdHMgYm9vbCgnJykgdmFsdWUgaXMgRmFsc2UuCgp8ID4+
PiB0eXBlKCcnKSwgYm9vbCgnJykKfCAoPGNsYXNzICdzdHInPiwgRmFsc2UpCgpUaGUgb3RoZXIg
aXMgYSBOb25lVHlwZSwgaXRzIGJvb2woTm9uZSkgdmFsdWUgaXMgRmFsc2UuCgp8ID4+PiB0eXBl
KE5vbmUpLCBib29sKE5vbmUpCnwgKDxjbGFzcyAnTm9uZVR5cGUnPiwgRmFsc2UpCgpOb25lIG9m
dGVuIHVzZWQgbGlrZSBOVUxMIChwb2ludGVyKS4gRS5nIGlmIGEgZnVuY3Rpb24gZG9lcyBub3Qg
Z2l2ZSBhbiBleHBsaWNpdCAKcmV0dXJuIHZhbHVlLCB0aGUgcmV0dXJuZWQgdmFsdWUgaXMgTm9u
ZS4KCnwgPj4+IGRlZiBmb28oKToKfCAuLi4gICAgIHBhc3MKfCAuLi4KfCA+Pj4gcHJpbnQoZm9v
KCkpCnwgTm9uZQoKCi0tIE1hcmt1cyAtLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

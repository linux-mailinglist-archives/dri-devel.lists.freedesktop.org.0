Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB8495B30
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCC410E940;
	Fri, 21 Jan 2022 07:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F4210E940
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642751492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=75bkqyZxoBCmGyx86nkpZvbmutNaowP1ANxplH0ep9s=;
 b=c0n/BzanvAUTT/bsHWZQ6PvWwxXCQUYCSGqWuvjcS09z7xAk5qiI3XqCq6lcDP9a5u9K4s
 euVhxmSP47quECdDkOFZk1q3MQBp0LcFsixs3iPPpF873KXnIAXHpOhPCMOCT0eQna1KXf
 IRI28bJZsb+JxsNhIzfMciSM1HVAW5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-RKgcfT-AMYe4TlXbrK2S7Q-1; Fri, 21 Jan 2022 02:51:26 -0500
X-MC-Unique: RKgcfT-AMYe4TlXbrK2S7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE0C1091DA2;
 Fri, 21 Jan 2022 07:51:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E78F16A54;
 Fri, 21 Jan 2022 07:51:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B7DAF18003A7; Thu, 20 Jan 2022 12:51:35 +0100 (CET)
Date: Thu, 20 Jan 2022 12:51:35 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220120115135.f5l4sxbskzgf6ckl@sirius.home.kraxel.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
 <87bl0amc6s.fsf@x1.stackframe.org>
 <20220118103323.4bae3a7d@eldfell>
 <20220118095352.xsb6fqacw4p276c5@sirius.home.kraxel.org>
 <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWV+-+Jr7HggbfH_GEDcdep4pJLiMG+15jxBvQ91BCS0w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > fbcon could do the same, i.e. render to fbdev in a 60Hz timer instead of
> > doing it synchronously.
> 
> Hopefully only the parts of the screen which need a redraw?

Sure.  drm fbdev emulation with shadow framebuffer tracks changes and
only flushes dirty areas to the real framebuffer.

fbcon could do the same when implementing lazy rendering, keeping track
of the chars/attrs which did actually change and only render those to
the (emulated or real) fbdev.

take care,
  Gerd


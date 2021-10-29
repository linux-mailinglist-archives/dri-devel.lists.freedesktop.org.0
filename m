Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C44C843F72F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 08:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0817A6E9ED;
	Fri, 29 Oct 2021 06:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A34E6E9ED
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 06:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635489105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g265pPN4pXsNBIUvhLGa7DoHMyiw6bEnJxXfu+fMVw8=;
 b=VZVs+XeH1yeY3poFi4mRNXihkL81OkS5asKJfGjt/5057qpDG9Dq2biExSdO4NT8ZEBpnk
 xy6qgCroj+eG/EjiSqC9qP+14pA/3G7XFobB57tcy25RYMKuLPcry1NkvvcgM4Xp5Zr27h
 dHyrKQUveIXn3tJ2sj50zVxo6rGm7A8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-YJkREjVfPZ6Kp1nXVr6mRw-1; Fri, 29 Oct 2021 02:31:40 -0400
X-MC-Unique: YJkREjVfPZ6Kp1nXVr6mRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F228D1808310;
 Fri, 29 Oct 2021 06:31:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-241.phx2.redhat.com
 [10.3.112.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BA3F60BF1;
 Fri, 29 Oct 2021 06:31:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 597DA1800393; Fri, 29 Oct 2021 08:31:36 +0200 (CEST)
Date: Fri, 29 Oct 2021 08:31:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@linux.ie>
Subject: Re: [PATCH] MAINTAINERS: add reviewers for virtio-gpu
Message-ID: <20211029063136.lbyba36heks6wjuc@sirius.home.kraxel.org>
References: <20211028213446.955338-1-olvaffe@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20211028213446.955338-1-olvaffe@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 02:34:46PM -0700, Chia-I Wu wrote:
> Add Gurchetan Singh and me as reviewers for virtio-gpu.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Acked-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Gerd Hoffmann <kraxel@redhat.com>

Pushed to drm-misc-next.

thanks,
  Gerd


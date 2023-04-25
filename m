Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB96EEF5F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 09:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A622210E8EB;
	Wed, 26 Apr 2023 07:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 497 seconds by postgrey-1.36 at gabe;
 Tue, 25 Apr 2023 20:05:01 UTC
Received: from mxout5.internetbrands.com (mxout5.internetbrands.com
 [98.158.192.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70A010E5A6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 20:05:01 +0000 (UTC)
Received: from la1-kvm184.internetbrands.com (unknown [10.16.82.5])
 by mxout5.internetbrands.com (Postfix) with ESMTP id 0CE057DF68AD;
 Tue, 25 Apr 2023 12:56:43 -0700 (PDT)
From: kernel@linuxace.com
To: tzimmermann@suse.de
Subject: RE: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
Date: Tue, 25 Apr 2023 12:56:42 -0700
Message-Id: <20230425195642.2898-1-kernel@linuxace.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
References: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 26 Apr 2023 07:36:59 +0000
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
Cc: kernel@linuxace.com, jfalempe@redhat.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 8:03 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>  You cannot really revert it, as it's too old already. But could you
>  please try the latest developer tree from
>
>     git://anongit.freedesktop.org/drm/drm-tip
>
>  The branch is drm-tip. Maybe the bug has been fixed meanwhile. If this
>  also doesn't work, we can take a closer look at the changes.

I tried drm-tip, and it did not help.

Thanks,
Phil
